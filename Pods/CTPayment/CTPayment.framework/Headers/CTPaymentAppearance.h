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
 Defaults to [UIColor whiteColor];
 */
@property (nonatomic, strong) UIColor *containerBackgroundColor;

/**
 Defaults to [UIColor whiteColor]
 */
@property (nonatomic, strong) UIColor *textFieldBackgroundColor;

/**
 Defaults to [UIColor colorWithRed:213.0/255.0 green:213.0/255.0 blue:213.0/255.0 alpha:1]
 */
@property (nonatomic, strong) UIColor *textFieldBorderColor;

/**
 Defaults to [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1]
 */
@property (nonatomic, strong) UIColor *textFieldActiveBorderColor;

/**
 Defaults to [UIColor colorWithRed:203.0/255.0 green:0/255.0 blue:0/255.0 alpha:1]
 */
@property (nonatomic, strong) UIColor *errorColor;

/**
 Defaults to [UIColor colorWithRed:15.0/255.0 green:92.0/255.0 blue:47.0/255.0 alpha:1]
 */
@property (nonatomic, strong) UIColor *successColor;

/**
 Defaults to [UIColor colorWithRed:214.0/255.0 green:79.0/255.0 blue:6.0/255.0 alpha:1]
 */
@property (nonatomic, strong) UIColor *warningColor;

/**
 Defaults to 1
 */
@property (nonatomic) CGFloat textFieldBorderWidth;

/**
 Defaults to 5
 */
@property (nonatomic) CGFloat textFieldCornerRadius;

/**
 Defaults to [UIColor colorWithRed:117.0/255.0 green:117.0/255.0 blue:117.0/255.0 alpha:1];
 */
@property (nonatomic, strong) UIColor *placeholderColor;

/**
 Defaults to [UIFont systemFontOfSize:18]
 */
@property (nonatomic, strong) UIFont *placeholderFont;

/**
 Defaults to [UIFont systemFontOfSize:14]
 */
@property (nonatomic, strong) UIFont *placeholderFloatLabelFont;

/**
 Defaults to [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1]
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 Defaults to [UIFont systemFontOfSize:14]
 */
@property (nonatomic, strong) UIFont *messageFont;

/**
 Defaults to 60
 */
@property (nonatomic) CGFloat textFieldHeight;

/**
 Defaults to 16
 */
@property (nonatomic) CGFloat generalSpacing;

/**
 Defaults to empty dictionary
 */
@property (nonatomic, strong) NSDictionary *cardImageDict;

@end
