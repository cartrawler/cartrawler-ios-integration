//
//  CTPayment.h
//  CTPayment
//
//  Created by Alan on 10/02/2017.
//  Copyright © 2017 Car Trawler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CTPaymentAppearance.h"
#import "CTPaymentErrorCodes.h"

@class CTPayment;

/**
 Implement this protocol to receive delegate updates from the library
 */
@protocol CTPaymentDelegate <NSObject>
@required
/**
 Callback for makePaymentWithJSON indicating success

 @param payment the CTPayment instance
 @param response a dictionary containing successful booking details
 */
- (void)payment:(CTPayment *)payment didSucceedWithResponse:(NSDictionary *)response;

/**
 Callback for makePaymentWithJSON indicating failure

 @param payment the CTPayment instance
 @param error the error, see CTPaymentErrorCodes to interpret error code
 */
- (void)payment:(CTPayment *)payment didFailWithError:(NSError *)error;


/**
 Callback for when there is invalid data in the text inputs
 @param successfulValidation indicates successful validation
 */
- (void)payment:(CTPayment *)payment didSucceedValidation:(BOOL)successfulValidation;

@end


/**
 The main interface to the library
 */
@interface CTPayment : NSObject

/**
 Set this delegate to receive updates from the library
 */
@property (nonatomic, weak) id <CTPaymentDelegate> delegate;


/**
 Initialise the payment library with a container view and customised parameters

 @param containerView the container view in which the payment view will be placed. Should be minimum 200 points height
 @param language language code to determine which localized strings will be used
 @param appearance optional appearance object for customisation. Pass in nil for default appearance
 @param debug boolean indicating whether to use development or production endpoint
 @param active a boolean indicating whether the first textfield should be selected and keyboard displayed
 @return a CTPayment instance
 */
- (instancetype)initWithContainerView:(UIView *)containerView
                             language:(NSString *)language
                           appearance:(CTPaymentAppearance *)appearance
                                debug:(BOOL)debug
                               active:(BOOL)active;

/**
 Call this once valid entries have been entered
 The JSON will be injected with the card details and communicated to the Car Trawler secure back end

 @param json Vehicle booking JSON with placeholders for card details
 */
- (void)makePaymentWithJSON:(NSString *)json;
/**
 Call this when you need to make a payment without using the framework form.
 The JSON will be injected without the card details and communicated to the Car Trawler secure back end
 
 @param json Vehicle booking JSON
 */
- (void)makeCustomPaymentWithJSON:(NSString *)json;

@end
