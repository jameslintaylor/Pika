//
//  MapDelegate.swift
//  Pika
//
//  Created by James Taylor on 2016-07-22.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

import Mapbox
import FLAnimatedImage

class MapDelegate: NSObject, MGLMapViewDelegate {
    
    var onload = true
    
    func mapView(mapView: MGLMapView, didUpdateUserLocation userLocation: MGLUserLocation?) {
        guard onload,
            let coordinates = userLocation?.coordinate else { return }
    
        mapView.setCenterCoordinate(coordinates, zoomLevel: 12, animated: false)
        onload = false
    }
    
    func mapView(mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        switch annotation {
        case is MGLUserLocation: return false
        default: return true
        }
    }

    func mapView(mapView: MGLMapView, calloutViewForAnnotation annotation: MGLAnnotation) -> UIView? {
        guard let encounterAnnotation = annotation as? EncounterAnnotation else { return nil }
        return EncounterCalloutView(annotation: encounterAnnotation)
    }
    
    func mapView(mapView: MGLMapView, viewForAnnotation annotation: MGLAnnotation) -> MGLAnnotationView? {
        
        switch annotation {
            
        case let encounterAnnotation as EncounterAnnotation:
            let pokemon = encounterAnnotation.encounter.pokemon
            let rarity = pokemon.rarity
            let stage = pokemon.evolutionStage
            let id = "\(rarity)\(stage.rawValue)"
        
            return mapView.dequeueReusableAnnotationViewWithIdentifier(id) ?? PikaAnnotationView(reuseIdentifier: id).with {
                $0.frame.size = pokemon.pinSize
                $0.imageSpec = ImageSpec(imageName: pokemon.pinImageName, renderingMode: .AlwaysOriginal)
                $0.pulseSpec = PulseSpec(mode: .onSelected, color: .whiteColor(), radius: 30, singlePulseDuration: 4, concurrentPulses: 4)
            }
            
        case is ScannerAnnotation:
            return mapView.dequeueReusableAnnotationViewWithIdentifier("scanner") ?? PikaAnnotationView(reuseIdentifier: "scanner").with {
                $0.frame.size = CGSize(width: 100, height: 100)
                $0.imageSpec = ImageSpec(imageName: "scanner_pin", renderingMode: .AlwaysOriginal)
                $0.pulseSpec = PulseSpec(mode: .always, color: UIColor(white: 1, alpha: 0.5), radius: 200, singlePulseDuration: 8, concurrentPulses: 1)
            }
            
        default: return nil
        }
    }
}

private extension Pokemon {
    
    var pinImageName: String {
        switch self.rarity {
        case .starter(let starter): return starter.pinImageName
        case .common: return "pokemon_pin"
        case .uncommon: return "pokemon_pin"
        case .rare: return "pokemon_pin_great"
        case .epic: return "pokemon_pin_ultra"
        case .legendary: return "pokemon_pin_master"
        case .mewtwo: return "pokemon_pin_master"
        }
    }
}

private extension StarterPokemon {
    var pinImageName: String {
        switch self {
        case .bulbasaur: return "bulbsaur_pin"
        case .charmander: return "charmander_pin"
        case .squirtle: return "squirtle_pin"
        case .pichu: return "pichu_pin"
        }
    }
}

private extension Pokemon {
    var pinSize: CGSize {
        switch self.evolutionStage {
        case .one: return CGSize(width: 60, height: 60)
        case .two: return CGSize(width: 80, height: 80)
        case .three: return CGSize(width: 100, height: 100)
        }
    }
}
