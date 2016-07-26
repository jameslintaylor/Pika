//
//  ScannedLocation.swift
//  Pika
//
//  Created by James Taylor on 2016-07-25.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

struct ScannedLocation {
    let coordinates: Coordinates
    let date: NSDate
    let id: String
}

extension ScannedLocation {
    init?(json: JSON) {
        guard let latitude = json["latitude"] as? Double,
            longitude = json["longitude"] as? Double,
            time = json["last_modified"] as? Double,
            id = json["scanned_id"] as? String else { return nil }
        
        coordinates = (latitude, longitude)
        date = NSDate(timeIntervalSince1970: time/1000)
        self.id = id
    }
}