//
//  Rarity.swift
//  Pika
//
//  Created by James Taylor on 2016-07-23.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

enum Rarity {
    case starter(StarterPokemon)
    case common 
    case uncommon
    case rare
    case epic
    case legendary
    case mewtwo
}

extension Rarity: Equatable {}

func == (lhs: Rarity, rhs: Rarity) -> Bool {
    switch (lhs, rhs) {
    case (.starter(let s1), .starter(let s2)): return s1 == s2
    case (.common, .common): return true
    case (.uncommon, .uncommon): return true
    case (.rare, .rare): return true
    case (.epic, .epic): return true
    case (.legendary, .legendary): return true
    case (.mewtwo, .mewtwo): return true
    default: return false
    }
}