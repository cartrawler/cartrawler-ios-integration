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
        let primaryColor = UIColor(red: 3.0/255.0, green: 56.0/255.0, blue: 141.0/255.0, alpha: 1.0)
        let secondaryColor = UIColor(red: 3.0/255.0, green:56.0/255.0, blue:141.0/255.0, alpha: 1.0)
        let accentColor = UIColor(red: 241.0/255.0, green: 201.0/255.0, blue: 51.0/255.0, alpha: 1.0)

        let style = CTStyle.init(primaryColor: primaryColor, secondaryColor: secondaryColor, accentColor: accentColor, regularFont: nil, boldFont: nil, italicFont: nil)
        CarTrawlerSDK.sharedInstance().initialiseSDK(with: style, customParameters: nil, production: false)
        return true
    }

}

