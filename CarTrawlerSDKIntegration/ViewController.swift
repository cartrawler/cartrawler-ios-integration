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
        let context = CTContext(implementationID: "d3ae1b67-6588-4edf-904c-c896e9ba9594", clientID: "122070", flow: .standAlone)
        
        /* Optional params */
        context.countryCode = "IE" // Default device country code
        context.currencyCode = "EUR" // Default device currency code
        context.languageCode = "EN" // Default EN
        context.pickupDate = Date(timeIntervalSinceNow: 86400) // next day
        context.dropOffDate = Date(timeIntervalSinceNow: 86400 * 3) // next day + 3 days
        context.pickupLocation = "AMS"
        context.dropOffLocation = "ORY"
        
        CarTrawlerSDK.sharedInstance().present(from: self, context: context)
    }
    
    @IBAction func requestVehicles(_ sender: UIButton) {
        
        let params = CTAPIQueryParams()
        params.delegate = self
        params.clientID = "122070"
        params.iataCode = "AMS"
        params.iataCodeDropoff = "ORY"
        params.currencyCode = "GBP"
        params.languageCode = "en"
        params.pickupDate = Date(timeIntervalSinceNow: 86400) // next day
        params.dropOffDate = Date(timeIntervalSinceNow: 86400 * 3) // next day + 3 days
        params.numberOfVehicles = 5 // Default 0, it will return all vehicles

        CarTrawlerSDK.sharedInstance().requestVehicles(params)
    }
    
}

extension ViewController: CarTrawlerSDKDelegate {
    func didProduce(inPathPaymentRequest request: [AnyHashable : Any], vehicle: CTInPathVehicle, payment: Payment) {
        
    }
    
    func didReceiveVehicles(_ vehicles: [CTVehicleDetails]) {
        print("vehicles: \(vehicles)")
    }
    
    func didFailToReceiveVehicles(error: Error) {
        print("error: \(error)")
    }
}

