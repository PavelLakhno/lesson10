//
//  PLDoctor.m
//  Notification
//
//  Created by Pavel on 13/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import "PLDoctor.h"
#import "PLCovernment.h"

@implementation PLDoctor

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryChangeNotification:)
                   name:PLCovernmentSalaryDidChangeNotification
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
                 object:nil];    }
    return self;
}

- (void) didEnterBackgroundNotification:(NSNotification*) notification
{
    NSLog(@"%@ turn off application",self.name);
}

- (void) willEnterForegroundNotification:(NSNotification*) notification
{
    NSLog(@"%@ turn on application",self.name);
}

- (void) salaryChangeNotification: (NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:PLCovernmentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
    
    if(salary < self.salary) {
        NSLog(@"Doctors are NOT happy");
    } else {
        NSLog(@"Doctors are happy");
    }
    self.salary = salary;
}

- (void) averagePriceChangeNotification: (NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:PLCovernmentAveragePriceUserInfoKey];
    
    CGFloat averagePrice = [value floatValue];
    
    if(averagePrice > self.averagePrice) {
        NSLog(@"Doctors are CRAZY");
    } else {
        NSLog(@"Doctors are happy");
    }
    self.averagePrice = averagePrice;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
