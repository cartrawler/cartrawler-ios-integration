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
        let primaryColor = UIColor.blue;
        let secondaryColor = UIColor.black;
        let accentColor = UIColor.yellow;
        let style = CTStyle.init(primaryColor: primaryColor, secondaryColor: secondaryColor, accentColor: accentColor, regularFont: nil, boldFont: nil, italicFont: nil)
        CarTrawlerSDK.sharedInstance().initialiseSDK(with: style, customParameters: nil, production: false)
        return true
    }

}

