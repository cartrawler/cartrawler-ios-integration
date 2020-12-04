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
                            primaryColor: UIColor.white)
        
        let green = UIColor(red: 188/255, green: 209/255, blue: 60/255, alpha: 1.0)
        let blue = UIColor(red: 125/255, green: 144/255, blue: 167/255, alpha: 1.0)
        style.userInterfaceStyle = .system
        style.primaryLightColor = blue // Optional, default light generated based on primary color
        style.primaryDarkColor = UIColor.white // Optional, default dark generated based on primary color
        style.ctaColor = green // Optional, default iOS blue RGB(0,122,255)
        style.ctaFontColor = UIColor.white  // Optional, default white or dark based on theme
        style.secondaryCtaColor = green // Optional, default primary color
        style.secondaryCtaFontColor = UIColor.white // Optional, default white or dark based on theme
        
        CarTrawlerSDK.sharedInstance().initialiseSDK(with: style, customParameters: nil, production: false)
        return true
    }

}

