//
//  PogomModel.swift
//  Pika
//
//  Created by James Taylor on 2016-07-21.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

import RxMoya
import RxSwift

struct PogomModel {
    
    let provider: RxMoyaProvider<Pogom>
    
    func getEncounters() -> Observable<[PokemonEncounter]> {
        return provider.request(.data(pokemons: true, gyms: false, pokestops: false))
            .mapJSON()
            .map { $0["pokemons"] as! JSONArray }
            .map { $0.flatMap(PokemonEncounter.init) }
    }
    
    func getScanned() -> Observable<[ScannedLocation]> {
        let coords: CoordinateBox = ((-90, -180), (90, 180))
        return provider.request(.scanned(boundingBox: coords))
            .mapJSON()
            .map { $0["scanned"] as! JSONArray }
            .map { $0.flatMap(ScannedLocation.init) }
    }
    
    func moveServerLocation(to: Coordinates) -> Observable<Response> {
        return provider.request(.move(coordinates: to))
    }
    
    func getServerLocation() -> Observable<Coordinates> {
        return provider.request(.location)
            .mapJSON()
            .map { ($0["lat"] as! Double, $0["lng"] as! Double) }
    }
}

extension PogomModel {
    
    func trackEncounters(every seconds: NSTimeInterval) -> Observable<[PokemonEncounter]> {
        
        let now = Observable<Int>.just(0)
        let recurring = Observable<Int>.interval(seconds, scheduler: MainScheduler.instance)
        
        return [now, recurring].concat()
            .flatMapLatest { _ in self.getEncounters() }
    }
    
    func updateServerLocation(to: Coordinates) -> Observable<Coordinates> {
        return moveServerLocation(to)
            .flatMap { _ in self.getServerLocation() }
    }
}
