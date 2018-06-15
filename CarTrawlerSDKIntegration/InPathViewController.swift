//
//  InPathViewController.swift
//  CarTrawlerSDKIntegration
//
//  Created by Elton Mendes Vieira Junior on 15/06/2018.
//  Copyright © 2018 Car Trawler. All rights reserved.
//

import UIKit
import CarTrawlerSDK

class InPathViewController: UIViewController , CarTrawlerSDKDelegate {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let pickUpDate = Date(timeIntervalSinceNow: 86400)
        
//        let passenger = CTPassenger(firstName: "Elton", lastName: "Mendes", addressLine1: "DunDrum", addressLine2: "Dublin 12", city: "Dublin", postcode: "000", countryCode: "IE", age: 24, email: "eltonmendes.j@gmail.com", phone: "083 8580001", isPrimaryDriver: true)

        // Do any additional setup after loading the view.
        CarTrawlerSDK.sharedInstance().addInPathCard(to: containerView, clientID: "105614", currency: "EUR", customerCountry: "IE", languageCode: "EN", iataCode: "ALC", pickupDate: pickUpDate, return: nil, flightNumber: "FL123", passengers: nil, delegate: self)
    }
    
    //MARK: IBAction
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func removeAction(_ sender: Any) {
        CarTrawlerSDK.sharedInstance().removeVehicle()
    }
    
    
    //MARK: Delegate
    
    func didTapCrossSellCard() {
        CarTrawlerSDK.sharedInstance().presentInPath(from: self)
    }
    
    func didReceiveBestDailyRate(_ price: NSNumber, currency: String) {
        self.textLabel.text = ("Cars from \(currency) \(price)")
    }
    
    func didFailToReceiveBestDailyRate() {
        print("Error on availability request")
    }
    
    // Required
    func didProduce(inPathPaymentRequest request: [AnyHashable : Any], vehicle: CTInPathVehicle) {
        
        print("\(request)")
        
        print("Total \(vehicle.totalCost)")
        print("Insurance \(vehicle.insuranceCost)")
        
        print("Vehicle Name \(vehicle.vehicleName)")
        print("Vehicle First Name \(vehicle.firstName)")
        print("Vehicle LastName \(vehicle.lastName)")
        
        print("*** PAYNOW: \(vehicle.payNowPrice)\n" ,
            "*** PAYLATER: \(vehicle.payLaterPrice)\n" ,
            "*** PAYDESK: \(vehicle.payAtDeskPrice)\n" ,
            "*** BOOKINGFEE: \(vehicle.bookingFeePrice)\n")
    }

}
