//
//  Pokemon.swift
//  Pika
//
//  Created by James Taylor on 2016-07-23.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

enum Pokemon {
    case bulbasaur
    case ivysaur
    case venusaur
    case charmander
    case charmeleon
    case charizard
    case squirtle
    case wartortle
    case blastoise
    case caterpie
    case metapod
    case butterfree
    case weedle
    case kakuna
    case beedrill
    case pidgey
    case pidgeotto
    case pidgeot
    case rattata
    case raticate
    case spearow
    case fearow
    case ekans
    case arbok
    case pikachu
    case pichu
    case raichu
    case sandshrew
    case sandslash
    case nidoranf
    case nidorina
    case nidoqueen
    case nidoranm
    case nidorino
    case nidoking
    case clefairy
    case clefable
    case vulpix
    case ninetales
    case jigglypuff
    case wigglytuff
    case zubat
    case golbat
    case oddish
    case gloom
    case vileplume
    case paras
    case parasect
    case venonat
    case venomoth
    case diglett
    case dugtrio
    case meowth
    case persian
    case psyduck
    case golduck
    case mankey
    case primeape
    case growlithe
    case arcanine
    case poliwag
    case poliwhirl
    case poliwrath
    case abra
    case kadabra
    case alakazam
    case machop
    case machoke
    case machamp
    case bellsprout
    case weepinbell
    case victreebel
    case tentacool
    case tentacruel
    case geodude
    case graveler
    case golem
    case ponyta
    case rapidash
    case slowpoke
    case slowbro
    case magnemite
    case magneton
    case farfetchd
    case doduo
    case dodrio
    case seel
    case dewgong
    case grimer
    case muk
    case shellder
    case cloyster
    case gastly
    case haunter
    case gengar
    case onix
    case drowzee
    case hypno
    case krabby
    case kingler
    case voltorb
    case electrode
    case exeggcute
    case exeggutor
    case cubone
    case marowak
    case hitmonlee
    case hitmonchan
    case lickitung
    case koffing
    case weezing
    case rhyhorn
    case rhydon
    case chansey
    case tangela
    case kangaskhan
    case horsea
    case seadra
    case goldeen
    case seaking
    case staryu
    case starmie
    case mrmime
    case scyther
    case jynx
    case electabuzz
    case magmar
    case pinsir
    case tauros
    case magikarp
    case gyarados
    case lapras
    case ditto
    case eevee
    case vaporeon
    case jolteon
    case flareon
    case porygon
    case omanyte
    case omastar
    case kabuto
    case kabutops
    case aerodactyl
    case snorlax
    case articuno
    case zapdos
    case moltres
    case dratini
    case dragonair
    case dragonite
    case mewtwo
    case unknown(name: String)
}

extension Pokemon {
    
    init(name: String) {
        switch name {
        case "Bulbasaur": self = .bulbasaur
        case "Ivysaur": self = .ivysaur
        case "Venusaur": self = .venusaur
        case "Charmander": self = .charmander
        case "Charmeleon": self = .charmeleon
        case "Charizard": self = .charizard
        case "Squirtle": self = .squirtle
        case "Wartortle": self = .wartortle
        case "Blastoise": self = .blastoise
        case "Caterpie": self = .caterpie
        case "Metapod": self = .metapod
        case "Butterfree": self = .butterfree
        case "Weedle": self = .weedle
        case "Kakuna": self = .kakuna
        case "Beedrill": self = .beedrill
        case "Pidgey": self = .pidgey
        case "Pidgeotto": self = .pidgeotto
        case "Pidgeot": self = .pidgeot
        case "Rattata": self = .rattata
        case "Raticate": self = .raticate
        case "Spearow": self = .spearow
        case "Fearow": self = .fearow
        case "Ekans": self = .ekans
        case "Arbok": self = .arbok
        case "Pikachu": self = .pikachu
        case "Pichu": self = .pichu
        case "Raichu": self = .raichu
        case "Sandshrew": self = .sandshrew
        case "Sandslash": self = .sandslash
        case "Nidoran♀": self = .nidoranf
        case "Nidorina": self = .nidorina
        case "Nidoqueen": self = .nidoqueen
        case "Nidoran♂": self = .nidoranm
        case "Nidorino": self = .nidorino
        case "Nidoking": self = .nidoking
        case "Clefairy": self = .clefairy
        case "Clefable": self = .clefable
        case "Vulpix": self = .vulpix
        case "Ninetales": self = .ninetales
        case "Jigglypuff": self = .jigglypuff
        case "Wigglytuff": self = .wigglytuff
        case "Zubat": self = .zubat
        case "Golbat": self = .golbat
        case "Oddish": self = .oddish
        case "Gloom": self = .gloom
        case "Vileplume": self = .vileplume
        case "Paras": self = .paras
        case "Parasect": self = .parasect
        case "Venonat": self = .venonat
        case "Venomoth": self = .venomoth
        case "Diglett": self = .diglett
        case "Dugtrio": self = .dugtrio
        case "Meowth": self = .meowth
        case "Persian": self = .persian
        case "Psyduck": self = .psyduck
        case "Golduck": self = .golduck
        case "Mankey": self = .mankey
        case "Primeape": self = .primeape
        case "Growlithe": self = .growlithe
        case "Arcanine": self = .arcanine
        case "Poliwag": self = .poliwag
        case "Poliwhirl": self = .poliwhirl
        case "Poliwrath": self = .poliwrath
        case "Abra": self = .abra
        case "Kadabra": self = .kadabra
        case "Alakazam": self = .alakazam
        case "Machop": self = .machop
        case "Machoke": self = .machoke
        case "Machamp": self = .machamp
        case "Bellsprout": self = .bellsprout
        case "Weepinbell": self = .weepinbell
        case "Victreebel": self = .victreebel
        case "Tentacool": self = .tentacool
        case "Tentacruel": self = .tentacruel
        case "Geodude": self = .geodude
        case "Graveler": self = .graveler
        case "Golem": self = .golem
        case "Ponyta": self = .ponyta
        case "Rapidash": self = .rapidash
        case "Slowpoke": self = .slowpoke
        case "Slowbro": self = .slowbro
        case "Magnemite": self = .magnemite
        case "Magneton": self = .magneton
        case "Farfetchd": self = .farfetchd
        case "Doduo": self = .doduo
        case "Dodrio": self = .dodrio
        case "Seel": self = .seel
        case "Dewgong": self = .dewgong
        case "Grimer": self = .grimer
        case "Muk": self = .muk
        case "Shellder": self = .shellder
        case "Cloyster": self = .cloyster
        case "Gastly": self = .gastly
        case "Haunter": self = .haunter
        case "Gengar": self = .gengar
        case "Onix": self = .onix
        case "Drowzee": self = .drowzee
        case "Hypno": self = .hypno
        case "Krabby": self = .krabby
        case "Kingler": self = .kingler
        case "Voltorb": self = .voltorb
        case "Electrode": self = .electrode
        case "Exeggcute": self = .exeggcute
        case "Exeggutor": self = .exeggutor
        case "Cubone": self = .cubone
        case "Marowak": self = .marowak
        case "Hitmonlee": self = .hitmonlee
        case "Hitmonchan": self = .hitmonchan
        case "Lickitung": self = .lickitung
        case "Koffing": self = .koffing
        case "Weezing": self = .weezing
        case "Rhyhorn": self = .rhyhorn
        case "Rhydon": self = .rhydon
        case "Chansey": self = .chansey
        case "Tangela": self = .tangela
        case "Kangaskhan": self = .kangaskhan
        case "Horsea": self = .horsea
        case "Seadra": self = .seadra
        case "Goldeen": self = .goldeen
        case "Seaking": self = .seaking
        case "Staryu": self = .staryu
        case "Starmie": self = .starmie
        case "Mr. Mime": self = .mrmime
        case "Scyther": self = .scyther
        case "Jynx": self = .jynx
        case "Electabuzz": self = .electabuzz
        case "Magmar": self = .magmar
        case "Pinsir": self = .pinsir
        case "Tauros": self = .tauros
        case "Magikarp": self = .magikarp
        case "Gyarados": self = .gyarados
        case "Lapras": self = .lapras
        case "Ditto": self = .ditto
        case "Eevee": self = .eevee
        case "Vaporeon": self = .vaporeon
        case "Jolteon": self = .jolteon
        case "Flareon": self = .flareon
        case "Porygon": self = .porygon
        case "Omanyte": self = .omanyte
        case "Omastar": self = .omastar
        case "Kabuto": self = .kabuto
        case "Kabutops": self = .kabutops
        case "Aerodactyl": self = .aerodactyl
        case "Snorlax": self = .snorlax
        case "Articuno": self = .articuno
        case "Zapdos": self = .zapdos
        case "Moltres": self = .moltres
        case "Dratini": self = .dratini
        case "Dragonair": self = .dragonair
        case "Dragonite": self = .dragonite
        case "Mewtwo": self = .mewtwo
        default: self = .unknown(name: name)
        }
    }
    
    var name: String {
        switch self {
        case .bulbasaur: return "Bulbasaur"
        case .ivysaur: return "Ivysaur"
        case .venusaur: return "Venusaur"
        case .charmander: return "Charmander"
        case .charmeleon: return "Charmeleon"
        case .charizard: return "Charizard"
        case .squirtle: return "Squirtle"
        case .wartortle: return "Wartortle"
        case .blastoise: return "Blastoise"
        case .caterpie: return "Caterpie"
        case .metapod: return "Metapod"
        case .butterfree: return "Butterfree"
        case .weedle: return "Weedle"
        case .kakuna: return "Kakuna"
        case .beedrill: return "Beedrill"
        case .pidgey: return "Pidgey"
        case .pidgeotto: return "Pidgeotto"
        case .pidgeot: return "Pidgeot"
        case .rattata: return "Rattata"
        case .raticate: return "Raticate"
        case .spearow: return "Spearow"
        case .fearow: return "Fearow"
        case .ekans: return "Ekans"
        case .arbok: return "Arbok"
        case .pikachu: return "Pikachu"
        case .pichu: return "Pichu"
        case .raichu: return "Raichu"
        case .sandshrew: return "Sandshrew"
        case .sandslash: return "Sandslash"
        case .nidoranf: return "Nidoran♀"
        case .nidorina: return "Nidorina"
        case .nidoqueen: return "Nidoqueen"
        case .nidoranm: return "Nidoran♂"
        case .nidorino: return "Nidorino"
        case .nidoking: return "Nidoking"
        case .clefairy: return "Clefairy"
        case .clefable: return "Clefable"
        case .vulpix: return "Vulpix"
        case .ninetales: return "Ninetales"
        case .jigglypuff: return "Jigglypuff"
        case .wigglytuff: return "Wigglytuff"
        case .zubat: return "Zubat"
        case .golbat: return "Golbat"
        case .oddish: return "Oddish"
        case .gloom: return "Gloom"
        case .vileplume: return "Vileplume"
        case .paras: return "Paras"
        case .parasect: return "Parasect"
        case .venonat: return "Venonat"
        case .venomoth: return "Venomoth"
        case .diglett: return "Diglett"
        case .dugtrio: return "Dugtrio"
        case .meowth: return "Meowth"
        case .persian: return "Persian"
        case .psyduck: return "Psyduck"
        case .golduck: return "Golduck"
        case .mankey: return "Mankey"
        case .primeape: return "Primeape"
        case .growlithe: return "Growlithe"
        case .arcanine: return "Arcanine"
        case .poliwag: return "Poliwag"
        case .poliwhirl: return "Poliwhirl"
        case .poliwrath: return "Poliwrath"
        case .abra: return "Abra"
        case .kadabra: return "Kadabra"
        case .alakazam: return "Alakazam"
        case .machop: return "Machop"
        case .machoke: return "Machoke"
        case .machamp: return "Machamp"
        case .bellsprout: return "Bellsprout"
        case .weepinbell: return "Weepinbell"
        case .victreebel: return "Victreebel"
        case .tentacool: return "Tentacool"
        case .tentacruel: return "Tentacruel"
        case .geodude: return "Geodude"
        case .graveler: return "Graveler"
        case .golem: return "Golem"
        case .ponyta: return "Ponyta"
        case .rapidash: return "Rapidash"
        case .slowpoke: return "Slowpoke"
        case .slowbro: return "Slowbro"
        case .magnemite: return "Magnemite"
        case .magneton: return "Magneton"
        case .farfetchd: return "Farfetchd"
        case .doduo: return "Doduo"
        case .dodrio: return "Dodrio"
        case .seel: return "Seel"
        case .dewgong: return "Dewgong"
        case .grimer: return "Grimer"
        case .muk: return "Muk"
        case .shellder: return "Shellder"
        case .cloyster: return "Cloyster"
        case .gastly: return "Gastly"
        case .haunter: return "Haunter"
        case .gengar: return "Gengar"
        case .onix: return "Onix"
        case .drowzee: return "Drowzee"
        case .hypno: return "Hypno"
        case .krabby: return "Krabby"
        case .kingler: return "Kingler"
        case .voltorb: return "Voltorb"
        case .electrode: return "Electrode"
        case .exeggcute: return "Exeggcute"
        case .exeggutor: return "Exeggutor"
        case .cubone: return "Cubone"
        case .marowak: return "Marowak"
        case .hitmonlee: return "Hitmonlee"
        case .hitmonchan: return "Hitmonchan"
        case .lickitung: return "Lickitung"
        case .koffing: return "Koffing"
        case .weezing: return "Weezing"
        case .rhyhorn: return "Rhyhorn"
        case .rhydon: return "Rhydon"
        case .chansey: return "Chansey"
        case .tangela: return "Tangela"
        case .kangaskhan: return "Kangaskhan"
        case .horsea: return "Horsea"
        case .seadra: return "Seadra"
        case .goldeen: return "Goldeen"
        case .seaking: return "Seaking"
        case .staryu: return "Staryu"
        case .starmie: return "Starmie"
        case .mrmime: return "Mr. Mime"
        case .scyther: return "Scyther"
        case .jynx: return "Jynx"
        case .electabuzz: return "Electabuzz"
        case .magmar: return "Magmar"
        case .pinsir: return "Pinsir"
        case .tauros: return "Tauros"
        case .magikarp: return "Magikarp"
        case .gyarados: return "Gyarados"
        case .lapras: return "Lapras"
        case .ditto: return "Ditto"
        case .eevee: return "Eevee"
        case .vaporeon: return "Vaporeon"
        case .jolteon: return "Jolteon"
        case .flareon: return "Flareon"
        case .porygon: return "Porygon"
        case .omanyte: return "Omanyte"
        case .omastar: return "Omastar"
        case .kabuto: return "Kabuto"
        case .kabutops: return "Kabutops"
        case .aerodactyl: return "Aerodactyl"
        case .snorlax: return "Snorlax"
        case .articuno: return "Articuno"
        case .zapdos: return "Zapdos"
        case .moltres: return "Moltres"
        case .dratini: return "Dratini"
        case .dragonair: return "Dragonair"
        case .dragonite: return "Dragonite"
        case .mewtwo: return "Mewtwo"
        case .unknown(let name): return name
        }
    }
}

extension Pokemon {
    
    var rarity: Rarity {
        
        switch self {
            
        case .bulbasaur: return .starter(.bulbasaur)
        case .ivysaur: return .starter(.bulbasaur)
        case .venusaur: return .starter(.bulbasaur)
            
        case .charmander: return .starter(.charmander)
        case .charmeleon: return .starter(.charmander)
        case .charizard: return .starter(.charmander)
            
        case .squirtle: return .starter(.squirtle)
        case .wartortle: return .starter(.squirtle)
        case .blastoise: return .starter(.squirtle)
            
        case .caterpie: return .common
        case .metapod: return .common
        case .butterfree: return .uncommon
            
        case .weedle: return .common
        case .kakuna: return .common
        case .beedrill: return .uncommon
            
        case .pidgey: return .common
        case .pidgeotto: return .common
        case .pidgeot: return .uncommon
            
        case .rattata: return .common
        case .raticate: return .common
            
        case .spearow: return .common
        case .fearow: return .uncommon
            
        case .ekans: return .common
        case .arbok: return .uncommon
            
        case .pichu: return .starter(.pichu)
        case .pikachu: return .starter(.pichu)
        case .raichu: return .starter(.pichu)
            
        case .sandshrew: return .common
        case .sandslash: return .uncommon
            
        case .nidoranf: return .common
        case .nidorina: return .common
        case .nidoqueen: return .uncommon
            
        case .nidoranm: return .common
        case .nidorino: return .common
        case .nidoking: return .uncommon
            
        case .clefairy: return .common
        case .clefable: return .uncommon
            
        case .vulpix: return .rare
        case .ninetales: return .epic
            
        case .jigglypuff: return .common
        case .wigglytuff: return .uncommon
            
        case .zubat: return .common
        case .golbat: return .common
            
        case .oddish: return .common
        case .gloom: return .common
        case .vileplume: return .uncommon
            
        case .paras: return .common
        case .parasect: return .common
            
        case .venonat: return .common
        case .venomoth: return .uncommon
            
        case .diglett: return .common
        case .dugtrio: return .uncommon
            
        case .meowth: return .common
        case .persian: return .uncommon
            
        case .psyduck: return .common
        case .golduck: return .uncommon
            
        case .mankey: return .uncommon
        case .primeape: return .rare
            
        case .growlithe: return .rare
        case .arcanine: return .epic
            
        case .poliwag: return .common
        case .poliwhirl: return .common
        case .poliwrath: return .uncommon
            
        case .abra: return .uncommon
        case .kadabra: return .rare
        case .alakazam: return .epic
            
        case .machop: return .common
        case .machoke: return .common
        case .machamp: return .uncommon
            
        case .bellsprout: return .common
        case .weepinbell: return .common
        case .victreebel: return .uncommon
            
        case .tentacool: return .common
        case .tentacruel: return .uncommon
            
        case .geodude: return .common
        case .graveler: return .common
        case .golem: return .rare
            
        case .ponyta: return .rare
        case .rapidash: return .epic
            
        case .slowpoke: return .uncommon
        case .slowbro: return .rare
            
        case .magnemite: return .uncommon
        case .magneton: return .rare
            
        case .farfetchd: return .rare
            
        case .doduo: return .uncommon
        case .dodrio: return .rare
            
        case .seel: return .common
        case .dewgong: return .uncommon
            
        case .grimer: return .uncommon
        case .muk: return .rare
            
        case .shellder: return .common
        case .cloyster: return .uncommon
            
        case .gastly: return .common
        case .haunter: return .uncommon
        case .gengar: return .rare
            
        case .onix: return .rare
            
        case .drowzee: return .common
        case .hypno: return .common
            
        case .krabby: return .common
        case .kingler: return .uncommon
            
        case .voltorb: return .uncommon
        case .electrode: return .rare
            
        case .exeggcute: return .uncommon
        case .exeggutor: return .rare
            
        case .cubone: return .uncommon
        case .marowak: return .rare
            
        case .hitmonlee: return .rare
        case .hitmonchan: return .rare
            
        case .lickitung: return .rare
            
        case .koffing: return .uncommon
        case .weezing: return .rare
            
        case .rhyhorn: return .uncommon
        case .rhydon: return .rare
            
        case .chansey: return .rare
            
        case .tangela: return .uncommon
            
        case .kangaskhan: return .rare
            
        case .horsea: return .common
        case .seadra: return .uncommon
            
        case .goldeen: return .common
        case .seaking: return .uncommon
            
        case .staryu: return .uncommon
        case .starmie: return .rare
            
        case .mrmime: return .rare
            
        case .scyther: return .rare
            
        case .jynx: return .common
            
        case .electabuzz: return .rare
        case .magmar: return .rare
            
        case .pinsir: return .rare
            
        case .tauros: return .uncommon
            
        case .magikarp: return .common
        case .gyarados: return .epic
            
        case .lapras: return .epic
            
        case .ditto: return .epic
            
        case .eevee: return .common
        case .vaporeon: return .rare
        case .jolteon: return .rare
        case .flareon: return .rare
            
        case .porygon: return .rare
            
        case .omanyte: return .uncommon
        case .omastar: return .rare
            
        case .kabuto: return .rare
        case .kabutops: return .epic
            
        case .aerodactyl: return .legendary
            
        case .snorlax: return .epic
            
        case .articuno: return .legendary
        case .zapdos: return .legendary
        case .moltres: return .legendary
            
        case .dratini: return .rare
        case .dragonair: return .epic
        case .dragonite: return .epic
            
        case .mewtwo: return .mewtwo
        case .unknown: return .mewtwo
        }
    }
    
    var evolutionStage: EvolutionStage {
        
        switch self {
            
        case .bulbasaur: return .one
        case .ivysaur: return .two
        case .venusaur: return .three
            
        case .charmander: return .one
        case .charmeleon: return .two
        case .charizard: return .three
            
        case .squirtle: return .one
        case .wartortle: return .two
        case .blastoise: return .three
            
        case .caterpie: return .one
        case .metapod: return .two
        case .butterfree: return .three
            
        case .weedle: return .one
        case .kakuna: return .two
        case .beedrill: return .three
            
        case .pidgey: return .one
        case .pidgeotto: return .two
        case .pidgeot: return .three
            
        case .rattata: return .one
        case .raticate: return .two
            
        case .spearow: return .one
        case .fearow: return .two
            
        case .ekans: return .one
        case .arbok: return .two
            
        case .pichu: return .one
        case .pikachu: return .two
        case .raichu: return .three
            
        case .sandshrew: return .one
        case .sandslash: return .two
            
        case .nidoranf: return .one
        case .nidorina: return .two
        case .nidoqueen: return .three
            
        case .nidoranm: return .one
        case .nidorino: return .two
        case .nidoking: return .three
            
        case .clefairy: return .one
        case .clefable: return .two
            
        case .vulpix: return .one
        case .ninetales: return .two
            
        case .jigglypuff: return .one
        case .wigglytuff: return .two
            
        case .zubat: return .one
        case .golbat: return .two
            
        case .oddish: return .one
        case .gloom: return .two
        case .vileplume: return .three
            
        case .paras: return .one
        case .parasect: return .two
            
        case .venonat: return .one
        case .venomoth: return .two
            
        case .diglett: return .one
        case .dugtrio: return .two
            
        case .meowth: return .one
        case .persian: return .two
            
        case .psyduck: return .one
        case .golduck: return .two
            
        case .mankey: return .one
        case .primeape: return .two
            
        case .growlithe: return .one
        case .arcanine: return .two
            
        case .poliwag: return .one
        case .poliwhirl: return .two
        case .poliwrath: return .three
            
        case .abra: return .one
        case .kadabra: return .two
        case .alakazam: return .three
            
        case .machop: return .one
        case .machoke: return .two
        case .machamp: return .three
            
        case .bellsprout: return .one
        case .weepinbell: return .two
        case .victreebel: return .three
            
        case .tentacool: return .one
        case .tentacruel: return .two
            
        case .geodude: return .one
        case .graveler: return .two
        case .golem: return .three
            
        case .ponyta: return .one
        case .rapidash: return .two
            
        case .slowpoke: return .one
        case .slowbro: return .two
            
        case .magnemite: return .one
        case .magneton: return .two
            
        case .farfetchd: return .one
            
        case .doduo: return .one
        case .dodrio: return .two
            
        case .seel: return .one
        case .dewgong: return .two
            
        case .grimer: return .one
        case .muk: return .two
            
        case .shellder: return .one
        case .cloyster: return .two
            
        case .gastly: return .one
        case .haunter: return .two
        case .gengar: return .three
            
        case .onix: return .one
            
        case .drowzee: return .one
        case .hypno: return .two
            
        case .krabby: return .one
        case .kingler: return .two
            
        case .voltorb: return .one
        case .electrode: return .two
            
        case .exeggcute: return .one
        case .exeggutor: return .two
            
        case .cubone: return .one
        case .marowak: return .two
            
        case .hitmonlee: return .one
        case .hitmonchan: return .one
            
        case .lickitung: return .one
            
        case .koffing: return .one
        case .weezing: return .two
            
        case .rhyhorn: return .one
        case .rhydon: return .two
            
        case .chansey: return .one
            
        case .tangela: return .one
            
        case .kangaskhan: return .one
            
        case .horsea: return .one
        case .seadra: return .two
            
        case .goldeen: return .one
        case .seaking: return .two
            
        case .staryu: return .one
        case .starmie: return .two
            
        case .mrmime: return .one
            
        case .scyther: return .one
            
        case .jynx: return .one
            
        case .electabuzz: return .one
        case .magmar: return .one
            
        case .pinsir: return .one
            
        case .tauros: return .one
            
        case .magikarp: return .one
        case .gyarados: return .two
            
        case .lapras: return .one
            
        case .ditto: return .one
            
        case .eevee: return .one
        case .vaporeon: return .two
        case .jolteon: return .two
        case .flareon: return .two
            
        case .porygon: return .one
            
        case .omanyte: return .one
        case .omastar: return .two
            
        case .kabuto: return .one
        case .kabutops: return .two
            
        case .aerodactyl: return .one
            
        case .snorlax: return .one
            
        case .articuno: return .one
        case .zapdos: return .one
        case .moltres: return .one
            
        case .dratini: return .one
        case .dragonair: return .two
        case .dragonite: return .three
            
        case .mewtwo: return .one
        case .unknown: return .one
        }
    }
}
