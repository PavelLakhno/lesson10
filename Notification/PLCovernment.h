//
//  PLCovernment.h
//  Notification
//
//  Created by Pavel on 08/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const PLCovernmentTaxLevelDidChangeNotification;
extern NSString* const PLCovernmentSalaryDidChangeNotification;
extern NSString* const PLCovernmentPensionDidChangeNotification;
extern NSString* const PLCovernmentAveragePriceDidChangeNotification;

extern NSString* const PLCovernmentTaxLevelUserInfoKey;
extern NSString* const PLCovernmentSalaryUserInfoKey;
extern NSString* const PLCovernmentPensionUserInfoKey;
extern NSString* const PLCovernmentAveragePriceUserInfoKey;

@interface PLCovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

- (void) setTaxLevel:(CGFloat)taxLevel;

@end
