//
//  Dictionary+Union.swift
//  Pika
//
//  Created by James Taylor on 2016-07-25.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func unionByOverwriting(
        dictionary: Dictionary<Key, Value>) {
        for (key, value) in dictionary {
            self[key] = value
        }
    }
    
    // Thanks Airspeed Velocity
    mutating func unionByOverwriting<S: SequenceType where
        S.Generator.Element == (Key,Value)>(sequence: S) {
        for (key, value) in sequence {
            self[key] = value
        }
    }
}