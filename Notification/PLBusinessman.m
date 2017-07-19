//
//  PLBusinessman.m
//  Notification
//
//  Created by Pavel on 28/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import "PLBusinessman.h"
#import "PLCovernment.h"

@implementation PLBusinessman

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
         
        [nc addObserver:self
               selector:@selector(taxLevelChangeNotification:)
                   name:PLCovernmentTaxLevelDidChangeNotification
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

- (void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -Notification

- (void) didEnterBackgroundNotification:(NSNotification*) notification
{
    NSLog(@"%@ turn off application",self.name);
}

- (void) willEnterForegroundNotification:(NSNotification*) notification
{
    NSLog(@"%@ turn on application",self.name);
}

-(void) taxLevelChangeNotification:(NSNotification*) notification
{
     NSNumber* value = [notification.userInfo objectForKey:PLCovernmentTaxLevelUserInfoKey];
    
    CGFloat taxLevel = [value floatValue];
    
    if(taxLevel < self.taxLevel) {
        NSLog(@"Businessmans are happy");
    } else {
        NSLog(@"Businessmans are NOT happy");
    }
    self.taxLevel = taxLevel;
    
}

- (void) averagePriceChangeNotification: (NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:PLCovernmentAveragePriceUserInfoKey];
    
    CGFloat averagePrice = [value floatValue];
        
    if(averagePrice > self.averagePrice) {
        NSLog(@"Businessmans are CRAZY");
    } else {
        NSLog(@"Businessmans are happy");
    }
    self.averagePrice = averagePrice;
}


@end
