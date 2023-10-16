//
//  InPathViewController.swift
//  CarTrawlerSDKIntegration
//
//  Copyright © 2019 CarTrawler. All rights reserved.
//

import UIKit
import CarTrawlerSDK

class InPathViewController: UIViewController {
    
    @IBOutlet weak var rentalStackView: UIStackView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var makePaymentButton: UIButton!
    @IBOutlet weak var paymentIndicator: UIActivityIndicatorView!
    
    var carTrawlerSDK: CarTrawlerSDK!
    
    var widgetContainer: CTWidgetContainer?
    var widgetContainer2: CTWidgetContainer?
    
    var payload: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carTrawlerSDK = CarTrawlerSDK.sharedInstance()
        
        let passenger = CTPassenger(firstName: "Ryan",
                                    lastName: "O'Connor",
                                    addressLine1: "DunDrum",
                                    addressLine2: "Dublin 14",
                                    city: "Dublin",
                                    postcode: "Dublin 12",
                                    countryCode: "IE",
                                    age: 25,
                                    email: "john.murphy@cartrawler.com",
                                    phone: "0838880000",
                                    phoneCountryPrefix: "353",
                                    loyaltyProgramNumber: "123456",
                                    isPrimaryDriver: true)
        
        let pickUpDate = Date(timeIntervalSinceNow: TimeInterval(86400 * 3))
        let returnDate = Date(timeIntervalSinceNow: TimeInterval(86400 * 6))

        let context = CTContext(implementationID: "7c4f7224-6447-468a-a7a2-caa2dd75b4c1", clientID: "122070", flow: .inPath)
        context.countryCode = "IE"
        context.currencyCode = "EUR"
        context.languageCode = "EN"
        context.pickupLocation = "DUB"
        context.pickupDate = pickUpDate
        context.dropOffDate = returnDate
        context.flightNumber = "FL1234"
        context.passengers = [passenger]
        context.delegate = self
        
        // Flight details
        let flightDetails = CTFlightDetails()
        flightDetails.passengerBreakdown = CTFlightPassengerBreakdown(adults: 2, teens: 0, children: 0, infants: 0)
        flightDetails.marketingPreference = true
        flightDetails.marketingSegment = "Budget Conscious"
        flightDetails.fareClass = "regular"
        flightDetails.flightFare = 101.99
        flightDetails.basketAmount = 130.99
        flightDetails.bags = 2
        flightDetails.sportsEquipment = 2
        flightDetails.sportsEquipmentBreakdown = ["golf": (1), "ski": (1), "surf": (1)]
        flightDetails.loyaltyNumber = "WZ123456789"
        flightDetails.loyaltyTier = "platinum"
        flightDetails.membershipID = "123222121"
        flightDetails.age = 32
        flightDetails.tripType = "business"
        flightDetails.tripDuration = 4
        flightDetails.context = "confirmation"
        flightDetails.pnr = "TEYI89"
        flightDetails.sessionID = "0idfw78jsnkoo"
        flightDetails.campaignID = "Google-EN-Destination-France"
        context.flightDetails = flightDetails
        
        self.carTrawlerSDK.setContext(context)
        
        let widgetContainer3 = self.carTrawlerSDK.getWidget(status: .simple, style: CTWidgetStyle(), delegate: self)
        self.rentalStackView.insertArrangedSubview(widgetContainer3, at: 0)
        
        self.widgetContainer2 = self.carTrawlerSDK.getWidget(status: .bestPrice, style: CTWidgetStyle(), delegate: self)
        self.rentalStackView.insertArrangedSubview(self.widgetContainer2!, at: 1)
    }
    
    //MARK: IBAction
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func makeInPathPayment() {
        if self.payload != nil {
            self.paymentIndicator.startAnimating()
            self.processPayment(payload: self.payload!)
        } else {
            self.showAlert()
        }
    }
    
    func showAlert() {
        let alert = self.customAlert(title: "Error", message: "No payload Available for payment")
        self.present(alert, animated: true, completion: nil)
    }
    
    func showResponseAlert(error: Error?, reservation: String?) {
        let title = error != nil ? "Error" : "Success"
        let message = error != nil ? error?.localizedDescription : "Reservation : \(reservation!)"
        let alert = self.customAlert(title: title, message: message!)
        self.present(alert, animated: true, completion: nil)
    }
    
    func customAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        return alert
    }
    
    func processPayment(payload: String) {
        let paymentController = PaymentController.init()
        paymentController.makePaymentFor(json: payload, completion: { (error, reservation) in
            if error == nil {
                // Payment with Success
                print("\(String(describing: reservation))")
            } else {
                // Payment Failed
                print("\(String(describing: error?.localizedDescription))")
            }
            
            OperationQueue.main.addOperation({
                self.paymentIndicator.stopAnimating()
                self.showResponseAlert(error: error, reservation: reservation)
            })
        })
    }
}

extension InPathViewController: CTWidgetContainerDelegate {
    func didTapView(_ container: CTWidgetContainer) {
        if container == self.widgetContainer {
            self.widgetContainer?.setStatus(.simpleAddedCar)
        } else {
            self.widgetContainer2?.setStatus(.vehicle)
        }
    }
    
    func didTapRemoveButton(_ container: CTWidgetContainer) {
        if container == self.widgetContainer {
            self.widgetContainer?.setStatus(.simple)
        } else {
            self.widgetContainer2?.setStatus(.bestPrice)
        }
    }
    
    func didTapAddCarHire(_ container: CTWidgetContainer) {
        self.carTrawlerSDK.presentInPath(from: self)
    }
    
    func vehicleSelected(_ vehicle: CTVehicleDetails) {
        self.widgetContainer2?.setVehicle(vehicle)
        self.widgetContainer2?.setStatus(.vehicle)
    }
}

extension InPathViewController: CarTrawlerSDKDelegate {
    func didProduce(inPathPaymentRequest request: [AnyHashable : Any], vehicle: CTInPathVehicle, payment: Payment) {
        print("\(request)")
        
        print("Total \(String(describing: vehicle.totalCost))")
        print("Insurance \(String(describing: vehicle.insuranceCost))")
        
        print("Vehicle Name \(String(describing: vehicle.vehicleName))")
        print("Vehicle First Name \(String(describing: vehicle.firstName))")
        print("Vehicle LastName \(String(describing: vehicle.lastName))")
        
        print("*** PAYNOW: \(String(describing: vehicle.payNowPrice))\n" ,
              "*** PAYLATER: \(String(describing: vehicle.payLaterPrice))\n" ,
              "*** PAYDESK: \(String(describing: vehicle.payAtDeskPrice))\n" ,
              "*** BOOKINGFEE: \(String(describing: vehicle.bookingFeePrice))\n")
        
        self.payload = request["ota"] as? String ?? nil
        self.makePaymentButton.isHidden = false
    }
    
    func didReceiveBestDailyRate(_ price: NSNumber, currency: String) {
        let price = String(format: "%@ %.2f", currency, price.floatValue)
        self.widgetContainer2?.setPrice(price)
    }
    
    func didFailToReceiveBestDailyRate(error: Error) {
        print("Error on availability request: %@", error.localizedDescription)
    }
    
}
