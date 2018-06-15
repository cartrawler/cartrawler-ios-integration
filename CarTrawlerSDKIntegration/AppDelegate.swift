//
//  AppDelegate.swift
//  CarTrawlerSDKIntegration
//
//  Created by Alan Mathews on 15/06/2018.
//  Copyright © 2018 Car Trawler. All rights reserved.
//

import UIKit
import CarTrawlerSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        CarTrawlerSDK.sharedInstance().initialiseSDK(with: nil, customParameters: nil, production: false)
        return true
    }

}

