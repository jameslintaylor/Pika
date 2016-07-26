//
//  ViewController.swift
//  Pika
//
//  Created by James Taylor on 2016-07-21.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import UIKit
import Mapbox

import RxMoya
import RxSwift

class ViewController: UIViewController {
    
    // Map
    @IBOutlet private weak var map: MGLMapView!
    let mapDelegate = MapDelegate()
    
    // Model
    var encounterAnnotations = [PokemonEncounter: EncounterAnnotation]()
//    var gyms =
//    var pokestops =
//    var scannedAnnotations = [ScannedLocation: ScannedLocation]()
    
    let pogom = PogomModel(provider: RxMoyaProvider(manager: .local))
    let disposeBag = DisposeBag()
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.showsUserLocation = true
        map.delegate = mapDelegate
        
        setupRx()
        
        pogom.getServerLocation()
            .map(ScannerAnnotation.init)
            .subscribeNext(map.addAnnotation)
            .addDisposableTo(disposeBag)
    }

    private func setupRx() {
        
        // Track Pokemon encounters
        pogom.trackEncounters(every: 20)
            .map(filterOut(rarities: [.common]))
            .subscribeNext(addEncounters)
            .addDisposableTo(disposeBag)
        
        // Resume annotation timers when app becomes active.
        NSNotificationCenter.defaultCenter().rx_notification(UIApplicationDidBecomeActiveNotification)
            .subscribeNext { _ in
                self.setupTimers(annotations: self.encounterAnnotations.values)
            }
            .addDisposableTo(disposeBag)
    }
    
    private func addEncounters(encounters: [PokemonEncounter]) {
        // Reverse engineer active encounters from the live annotations
        let activeEncounters = encounterAnnotations.values.map { $0.encounter }
        
        // Set operation to find unique new encounters
        let active = Set(activeEncounters)
        let new = Set(encounters)
        let toAdd = Array(new.subtract(active))
        
        // Add new annotations to map
        let annotationsToAdd = toAdd.map(EncounterAnnotation.init)
        map.addAnnotations(annotationsToAdd)
        setupTimers(annotations: annotationsToAdd)
        
        // Update encounter annotations dictionary with new annotations
        encounterAnnotations.unionByOverwriting(zip(toAdd, annotationsToAdd))
    }
    
    private func setupTimers<Annotations: CollectionType where Annotations.Generator.Element == EncounterAnnotation>(annotations annotations: Annotations) {
        
        annotations.forEach { annotation in
            let timeUntilDisappear = annotation.encounter.disappearDate.timeIntervalSinceNow
            
            // If the time has already expired, just remove the annotation
            if timeUntilDisappear < 0 {
                self.map.removeAnnotation(annotation)
                
            // Otherwise, start a new timer
            } else {
                Observable<Int>.timer(timeUntilDisappear, scheduler: MainScheduler.instance)
                    
                    // Before the app is backgrounded, we need to remove the timer. So long as it hasn't expired by the time the app re-enters the foreground, we'll start a new timer.
                    .takeUntil(NSNotificationCenter.defaultCenter().rx_notification(UIApplicationWillResignActiveNotification))
                    
                    .subscribeNext { _ in self.map.removeAnnotation(annotation) }
                    .addDisposableTo(disposeBag)
            }
        }
    }
    
    func addEncounter(encounter: PokemonEncounter) {
        
        // Add the annotation
        let annotation = EncounterAnnotation(encounter: encounter)
        map.addAnnotation(annotation)
        
        // Set the annotation to remove once the encounter is over
        let timeUntilDisappear = encounter.disappearDate.timeIntervalSinceNow
        Observable<Int>.timer(timeUntilDisappear, scheduler: MainScheduler.instance)
            
            // Before the app is backgrounded, we need to remove the timer. So long as it hasn't expired by the time the app re-enters the foreground, we'll start a new timer.
            .takeUntil(NSNotificationCenter.defaultCenter().rx_notification(UIApplicationWillResignActiveNotification))
            
            .subscribeNext { _ in self.map.removeAnnotation(annotation) }
            .addDisposableTo(disposeBag)
    }
}

extension ViewController {
    
    @IBAction private func moveServerToMe(sender: AnyObject) {
        guard let coordinates = map.userLocation?.coordinate else { return }
        pogom.updateServerLocation(coordinates.tuple)
            .subscribeNext() { (lat, lon) in print(lat, lon) }
            .addDisposableTo(disposeBag)
    }
}

// Helpers

private func filterOut(rarities rarities: [Rarity]) -> (encounters: [PokemonEncounter]) -> [PokemonEncounter] {
    return { encounters in
        encounters.filter { !rarities.contains($0.pokemon.rarity) }
    }
}
