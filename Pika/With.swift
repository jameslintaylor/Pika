//
//  With.swift
//  Pika
//
//  Created by James Taylor on 2016-07-21.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation
import UIKit

protocol With {}

extension With where Self: AnyObject {
    func with(@noescape t: (Self) throws -> ()) rethrows -> Self {
        try t(self)
        return self
    }
}

extension With where Self: Any {
    func with(@noescape t: (inout Self) throws -> ()) rethrows -> Self {
        var copy = self
        try t(&copy)
        return copy
    }
}

extension UIView: With {}
extension NSObject: With {}