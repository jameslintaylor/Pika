//
//  NetworkManagers.swift
//  Pika
//
//  Created by James Taylor on 2016-07-21.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

import Alamofire

extension Alamofire.Manager {
    
    /// 'Alamofire.Manager' for my local network that disables https evaluation
    static let local: Alamofire.Manager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "192.168.2.2": .DisableEvaluation
        ]
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = Alamofire.Manager.defaultHTTPHeaders
        
        return Alamofire.Manager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
    
    /// 'Alamofire.Manager' for default remote networks
    static let remote = Alamofire.Manager.sharedInstance
}
