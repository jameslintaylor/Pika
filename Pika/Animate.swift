//
//  Animate.swift
//  Pika
//
//  Created by James Taylor on 2016-07-23.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import UIKit

// 😶

func animate(@autoclosure(escaping) animation: () -> ()) {
    UIView.animateWithDuration(0.3, animations: animation)
}

func animate(@autoclosure(escaping) animation: () -> (), @autoclosure(escaping) completion: () -> ()) {
    UIView.animateWithDuration(0.3, animations: animation, completion: { _ in
        completion()
    })
}