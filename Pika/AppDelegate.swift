//
//  AppDelegate.swift
//  Pika
//
//  Created by James Taylor on 2016-07-21.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import UIKit 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(application: UIApplication) {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Sound, .Alert], categories: nil)
        application.registerUserNotificationSettings(notificationSettings)
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types != .None {
            application.registerForRemoteNotifications()
        }
    }
    
    // Github 🙃
    // デバイストークンを取得する
    func application( application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData ) {

        // <>と" "(空白)を取る
        let characterSet: NSCharacterSet = NSCharacterSet( charactersInString: "<>" )
        
        let deviceTokenString: String = ( deviceToken.description as NSString )
            .stringByTrimmingCharactersInSet( characterSet )
            .stringByReplacingOccurrencesOfString( " ", withString: "" ) as String
        
        print( "Device token: \(deviceTokenString)" )
    }
}


