//
//  EncounterAnnotation.swift
//  Pika
//
//  Created by James Taylor on 2016-07-22.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

import Mapbox

class EncounterAnnotation: NSObject, MGLAnnotation {
    
    let encounter: PokemonEncounter
    let coordinate: CLLocationCoordinate2D
    
    // Need title as non-nil value otherwise callout doesn't work
    let title: String? = ""
    
    init(encounter: PokemonEncounter) {
        self.encounter = encounter
        self.coordinate = CLLocationCoordinate2D(latitude: encounter.coordinates.latitude, longitude: encounter.coordinates.longitude)
    }
}
