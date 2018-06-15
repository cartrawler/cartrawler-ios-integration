//
//  CTPaymentAppearance.h
//  CTPayment
//
//  Created by Alan on 21/02/2017.
//  Copyright © 2017 Car Trawler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CTPaymentAppearance : NSObject

/**
 Defaults to [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:243.0/255.0 alpha:1.0]
 */
@property (nonatomic, strong) UIColor *containerBackgroundColor;

/**
 Defaults to [UIColor colorWithRed:213.0/255.0 green:213.0/255.0 blue:213.0/255.0 alpha:1]
 */
@property (nonatomic, strong) UIColor *textFieldBorderColor;

/**
 Defaults to 1
 */
@property (nonatomic) CGFloat textFieldBorderWidth;

/**
 Defaults to [UIColor whiteColor]
 */
@property (nonatomic, strong) UIColor *textFieldBackgroundColor;

/**
 Defaults to 5
 */
@property (nonatomic) CGFloat textFieldCornerRadius;

@end
