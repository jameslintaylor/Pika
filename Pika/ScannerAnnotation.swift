//
//  ScannerAnnotation.swift
//  Pika
//
//  Created by James Taylor on 2016-07-25.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

import Mapbox

class ScannerAnnotation: NSObject, MGLAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    
    // Need title as non-nil value otherwise callout doesn't work
    let title: String? = ""
    
    init(coordinates: Coordinates) {
        self.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}