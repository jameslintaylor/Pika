//
//  CountDownLabel.swift
//  Pika
//
//  Created by James Taylor on 2016-07-23.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa

class CountDownLabel: UILabel {
    
    let disposeBag = DisposeBag()
    let fireDate: NSDate
    
    init(fireDate: NSDate) {
        self.fireDate = fireDate
        super.init(frame: .zero)
        setupRx()
        startTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func setupRx() {
        NSNotificationCenter.defaultCenter().rx_notification(UIApplicationDidBecomeActiveNotification)
            .subscribeNext() { _ in self.startTimer() }
            .addDisposableTo(disposeBag)
    }
    
    private func startTimer() {
        let now = Observable<Int>.just(0)
        let recurring = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        
        [now, recurring].concat()
            
            // Remove the timer when the app is backgrounded
            .takeUntil(NSNotificationCenter.defaultCenter().rx_notification(UIApplicationWillResignActiveNotification))
            
            // To time remaining
            .map { _ in return self.fireDate.timeIntervalSinceNow }
            
            // Format and bind
            .map(format)
            .bindTo(rx_text)
            .addDisposableTo(disposeBag)
    }
}

// Helpers

private func format(timeInterval timeInterval: NSTimeInterval) -> String {
    let minutes = Int(timeInterval/60)
    let seconds = Int(timeInterval%60)
    
    return "\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
}
