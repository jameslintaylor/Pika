//
//  Pogom.swift
//  Pika
//
//  Created by James Taylor on 2016-07-21.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

import RxMoya

enum Pogom {
    case data(pokemons: Bool, gyms: Bool, pokestops: Bool)
    case scanned(boundingBox: CoordinateBox)
    case location
    case move(coordinates: Coordinates)
}

extension Pogom: RxMoya.TargetType {
    
    var baseURL: NSURL {
//        return NSURL(string: "https://jameslintaylor.com")!
        return NSURL(string: "https://192.168.2.2")!
    }
    
    var path: String {
        
        switch self {
        case .data: return "/raw_data"
        case .scanned: return "/raw_data"
        case .location: return "/loc"
        case .move: return "/next_loc"
        }
    }
    
    var parameters: [String : AnyObject]? {
        
        switch self {
        
        case .data(let pokemons, let gyms, let pokestops):
            return [
                "pokemon": String(pokemons),
                "gyms": String(gyms),
                "pokestops": String(pokestops)
            ]
            
        case .scanned(let bounds):
            return [
                "pokemon": "false",
                "gyms": "false",
                "pokestops": false,
                "scanned": "true",
                "swLat": String(bounds.sw.latitude),
                "swLng": String(bounds.sw.longitude),
                "neLat": String(bounds.ne.latitude),
                "neLng": String(bounds.ne.longitude)
            ]
        
        case .move(coordinates: let (latitude, longitude)):
            return [
                "lat": String(latitude),
                "lon": String(longitude)
            ]
            
        default: return nil
        }
    }
    
    var method: RxMoya.Method {
    
        switch self {
        case .data: return .GET
        case .scanned: return .GET
        case .location: return .GET
        case .move: return .POST
        }
    }
    
    var sampleData: NSData { return NSData() }
    
    var multipartBody: [MultipartFormData]? { return nil }
}

// Helpers

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

