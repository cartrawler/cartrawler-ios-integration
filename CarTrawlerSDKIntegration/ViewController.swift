//
//  ViewController.swift
//  CarTrawlerSDKIntegration
//
//  Created by Alan Mathews on 15/06/2018.
//  Copyright © 2018 Car Trawler. All rights reserved.
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
        CarTrawlerSDK.sharedInstance().presentStandAlone(from: self, clientID: "105614", countryCode: "IE", currencyCode: "EUR", languageCode: "EN", passengers: nil)
    }
    
}

