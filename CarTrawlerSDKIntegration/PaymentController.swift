//
//  PaymentController.swift
//  CarTrawlerSDKIntegration
//
//  Copyright © 2019 CarTrawler. All rights reserved.
//

import UIKit

class PaymentController: NSObject {
    
    func makePaymentFor(json: String,
                        completion:@escaping (_ error: Error?, _ reservationNumber: String?) -> Void) {
        
        let stringURL = "https://external-dev.cartrawler.com/cartrawlerpay/json?sec=true&type=OTA_VehResRQ"
        
        var formattedJson = json
        formattedJson = formattedJson.replacingOccurrences(of: "[CARDNUMBER]", with: "4111111111111111")
        formattedJson = formattedJson.replacingOccurrences(of: "[SERIESCODE]", with: "123")
        formattedJson = formattedJson.replacingOccurrences(of: "[EXPIREDATE]", with: "1220")
        formattedJson = formattedJson.replacingOccurrences(of: "[CARDCODE]", with: "VI")
        formattedJson = formattedJson.replacingOccurrences(of: "[EMAIL]", with: "user@cartrawler.com")
        formattedJson = formattedJson.replacingOccurrences(of: "[COUNTRYNAMECODE]", with: "IE")
        formattedJson = formattedJson.replacingOccurrences(of: "[TELEPHONE]", with: "123")
        formattedJson = formattedJson.replacingOccurrences(of: "[PASSENGERSURNAME]", with: "John")
        formattedJson = formattedJson.replacingOccurrences(of: "[PASSENGERFIRSTNAME]", with: "Murphy")
        formattedJson = formattedJson.replacingOccurrences(of: "[CARDHOLDERNAME]", with: "John Murphy")
        formattedJson = formattedJson.replacingOccurrences(of: "[POSTCODE]", with: "D14 R7V2")
        formattedJson = formattedJson.replacingOccurrences(of: "[CITY]", with: "Dublin")
        formattedJson = formattedJson.replacingOccurrences(of: "[ADDRESSLINE1]", with: "Dundrum Business Park, UNIT 1-4")
        formattedJson = formattedJson.replacingOccurrences(of: "[SURNAME]", with: "Murphy")
        
        let url = URL.init(string: stringURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = formattedJson.data(using: .utf8)
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        
        let task = URLSession.shared.dataTask(with: request,
                                              completionHandler: { (responseData: Data?, _: URLResponse?, error: Error?) in
                                                do {
                                                    guard let responseData = responseData else {
                                                        throw error ?? NSError(domain: "cartrawler.com", code: 500, userInfo: nil) as Error
                                                    }
                                                    
                                                    if let jsonresult = try JSONSerialization.jsonObject(with: responseData,
                                                                                                         options: .allowFragments) as? NSDictionary {
                                                        print(jsonresult)
                                                        let confirmation = self.confirmationForRental(json: jsonresult)
                                                        completion(confirmation.0, confirmation.1)
                                                    }
                                                } catch {
                                                    completion(error, nil)
                                                }
                                                
        })
        task.resume()
    }
    
    func confirmationForRental(json: NSDictionary) -> (Error?, String?) {
        
        if let resCore = json["VehResRSCore"] as? [String: Any] {
            if let reservation = resCore["VehReservation"] as? [String: Any] {
                if let vehCore = reservation["VehSegmentCore"] as? [String: Any] {
                    if let confirmation = vehCore["ConfID"] as? [String: Any] {
                        return (nil, confirmation["@ID"] as? String)
                    }
                }
            }
        }
        var errorMessage = "Invalid payment request"
        if let errors = json["Errors"] as? [String: Any] {
            if let error = errors["Error"] as? [String: Any],
                let errorStr = error["#text"] as? String {
                errorMessage = errorStr
            }
        }
        
        if let errorMessageStatus = json["@ErrorMessage"] as? String {
            errorMessage = errorMessageStatus
        }
        
        let returnError = NSError(domain: "cartrawler.com", code: 500, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        return (returnError, nil)
    }
}
