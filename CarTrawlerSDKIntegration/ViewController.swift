//
//  ViewController.swift
//  CarTrawlerSDKIntegration
//
//  Copyright © 2019 CarTrawler. All rights reserved.
//

import UIKit
import CarTrawlerSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func carRentalButtonTapped(_ sender: UIButton) {
        // Using context object
        let context = CTContext(clientID: "105614", flow: .standAlone)
        
        /* Optional params */
        context.countryCode = "IE" // Default device country code
        context.currencyCode = "EUR" // Default device currency code
        context.languageCode = "EN" // Default EN
        
        CarTrawlerSDK.sharedInstance().present(from: self, context: context)
    }
    
}

