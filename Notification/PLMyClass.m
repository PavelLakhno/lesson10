//
//  PLMyClass.m
//  Notification
//
//  Created by Pavel on 29/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import "PLMyClass.h"

@implementation PLMyClass

- (id)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(myClassWllResignActive:)
                   name:UIApplicationWillResignActiveNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(myClassDidEnterBackground:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(myClassWillEnterForeground:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(myClassDidBecomeActive:)
                   name:UIApplicationDidBecomeActiveNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(myClassWillTerminate:)
                   name:UIApplicationWillTerminateNotification
                 object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - NOTIFICATION -

- (void) myClassWllResignActive:(NSNotification*) notification {
    NSLog(@"It's my class notification");
}

- (void) myClassDidEnterBackground:(NSNotification*) notification {
    NSLog(@"It's my class notification");
}

- (void) myClassWillEnterForeground:(NSNotification*) notification {
    NSLog(@"It's my class notification");
}

- (void) myClassDidBecomeActive:(NSNotification*) notification {
    NSLog(@"It's my class notification");
}

- (void) myClassWillTerminate:(NSNotification*) notification {
    NSLog(@"It's my class notification");
}

@end
