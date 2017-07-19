//
//  PLCovernment.m
//  Notification
//
//  Created by Pavel on 08/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import "PLCovernment.h"


NSString* const PLCovernmentTaxLevelDidChangeNotification = @"PLCovernmentTaxLevelDidChangeNotification";
NSString* const PLCovernmentSalaryDidChangeNotification = @"PLCovernmentSalaryDidChangeNotification";
NSString* const PLCovernmentPensionDidChangeNotification = @"PLCovernmentPensionDidChangeNotification";
NSString* const PLCovernmentAveragePriceDidChangeNotification = @"PLCovernmentAveragePriceDidChangeNotification";


NSString* const PLCovernmentTaxLevelUserInfoKey = @"PLCovernmentTaxLevelUserInfoKey";
NSString* const PLCovernmentSalaryUserInfoKey = @"PLCovernmentSalaryUserInfoKey";
NSString* const PLCovernmentPensionUserInfoKey = @"PLCovernmentPensionUserInfoKey";
NSString* const PLCovernmentAveragePriceUserInfoKey = @"PLCovernmentAveragePriceUserInfoKey";

@implementation PLCovernment

- (id)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5;
        _salary = 1100;
        _pension = 550;
        _averagePrice = 15;
    }
    return self;
}

- (void) setTaxLevel:(CGFloat)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:PLCovernmentTaxLevelUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:PLCovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}


- (void) setSalary:(CGFloat)salary {
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:PLCovernmentSalaryUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:PLCovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(CGFloat)pension {
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:PLCovernmentPensionUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:PLCovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setAveragePrice:(CGFloat)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:PLCovernmentAveragePriceUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:PLCovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}






@end
