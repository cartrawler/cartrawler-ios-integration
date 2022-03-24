//
//  CTPaymentErrorCodes.h
//  CTPayment
//
//  Created by Alan on 20/02/2017.
//  Copyright © 2017 Car Trawler. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const CTPaymentErrorDomain;

typedef NS_ENUM(NSInteger, CTPaymentError) {
    CTPaymentErrorInvalidEntry, // Card details did not pass validation
    CTPaymentErrorMalformedJSON, // JSON was not correctly formed
    CTPaymentErrorConnection, // Connection error
    CTPaymentErrorServer // Bad server response
};

/**
 Payment error codes
 */
@interface CTPaymentErrorCodes : NSObject
@end
