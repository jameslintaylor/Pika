//
//  PokemonEncounter.swift
//  Pika
//
//  Created by James Taylor on 2016-07-21.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

struct PokemonEncounter {
    let pokemon: Pokemon
    let coordinates: Coordinates
    let disappearDate: NSDate
    let id: String
}

extension PokemonEncounter: JSONMappable {
    init?(json: JSON) {
        guard let name = json["pokemon_name"] as? String,
            latitude = json["latitude"] as? Double,
            longitude = json["longitude"] as? Double,
            disappearTime = json["disappear_time"] as? Double,
            id = json["encounter_id"] as? String else { return nil }
        
        pokemon = Pokemon(name: name)
        coordinates = (latitude, longitude)
        disappearDate = NSDate(timeIntervalSince1970: disappearTime/1000)
        self.id = id
    }
}

extension PokemonEncounter: Hashable {
    var hashValue: Int { return id.hashValue }
}

func == (lhs: PokemonEncounter, rhs: PokemonEncounter) -> Bool {
    return lhs.id == rhs.id
}
