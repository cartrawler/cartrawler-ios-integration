//
//  CTPaymentLocalization.h
//  CTPayment
//
//  Created by Alan on 18/02/2017.
//  Copyright © 2017 Car Trawler. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Manages localization of strings in the library
 */
@interface CTPaymentLocalization : NSObject

@property (strong, nonatomic) NSString *placeholderCardNumber;
@property (strong, nonatomic) NSString *placeholderName;
@property (strong, nonatomic) NSString *placeholderExpiration;
@property (strong, nonatomic) NSString *placeholderCVV;
@property (strong, nonatomic) NSString *titleDoneButton;
@property (strong, nonatomic) NSString *titleCancelButton;

@property (strong, nonatomic) NSString *errorEmptyCardNumber;
@property (strong, nonatomic) NSString *errorEmptyName;
@property (strong, nonatomic) NSString *errorEmptyCardExpiration;
@property (strong, nonatomic) NSString *errorEmptyCardSecurityCode;
@property (strong, nonatomic) NSString *errorInvalidCardNumber;
@property (strong, nonatomic) NSString *errorInvalidCVV;
@property (strong, nonatomic) NSString *errorInvalidExpirationDate;

@end
