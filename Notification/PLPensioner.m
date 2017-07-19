//
//  PLPensioner.m
//  Notification
//
//  Created by Pavel on 13/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import "PLPensioner.h"
#import "PLCovernment.h"

@implementation PLPensioner

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(pensionChangeNotification:)
                   name:PLCovernmentPensionDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangeNotification:)
                   name:PLCovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(didEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(willEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) didEnterBackgroundNotification:(NSNotification*) notification
{
    NSLog(@"%@ turn off application",self.name);
}

- (void) willEnterForegroundNotification:(NSNotification*) notification
{
    NSLog(@"%@ turn on application",self.name);
}

- (void) pensionChangeNotification: (NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:PLCovernmentPensionUserInfoKey];
    
    CGFloat pension = [value floatValue];
    
    if(pension < self.pension) {
        NSLog(@"Pensioners are NOT happy");
    } else {
        NSLog(@"Pensioners are happy");
    }
    self.pension = pension;
}

- (void) averagePriceChangeNotification: (NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:PLCovernmentAveragePriceUserInfoKey];
    
    CGFloat averagePrice = [value floatValue];
    
    if(averagePrice > self.averagePrice) {
        NSLog(@"Pensioners are CRAZY");
    } else {
        NSLog(@"Pensioners are happy");
    }
    self.averagePrice = averagePrice;
}
@end
