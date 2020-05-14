//
//  AppDelegate.swift
//  CarTrawlerSDKIntegration
//
//  Copyright © 2019 CarTrawler. All rights reserved.
//

import UIKit
import CarTrawlerSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let style = CTStyle(theme: .light,  // .dark or .light
                            primaryColor: UIColor.blue)
        
        style.primaryLightColor = UIColor.blue // Optional, default light generated based on primary color
        style.primaryDarkColor = UIColor.darkGray // Optional, default dark generated based on primary color
        style.ctaColor = UIColor.blue // Optional, default iOS blue RGB(0,122,255)
        style.ctaFontColor = UIColor.white  // Optional, default white or dark based on theme
        style.secondaryCtaColor = UIColor.red // Optional, default primary color
        style.secondaryCtaFontColor = UIColor.white // Optional, default white or dark based on theme
        
        CarTrawlerSDK.sharedInstance().initialiseSDK(with: style, customParameters: nil, production: false)
        return true
    }

}

