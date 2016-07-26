//
//  Coordinates.swift
//  Pika
//
//  Created by James Taylor on 2016-07-22.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation
import CoreLocation

typealias Coordinates = (latitude: Double, longitude: Double)

extension CLLocationCoordinate2D {
    var tuple: Coordinates {
        return (latitude, longitude)
    }
}

typealias CoordinateBox = (sw: Coordinates, ne: Coordinates)
