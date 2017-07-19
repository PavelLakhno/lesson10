//
//  PLAppDelegate.m
//  Notification
//
//  Created by Pavel on 08/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import "PLAppDelegate.h"
#import "PLCovernment.h"
#import "PLDoctor.h"
#import "PLPensioner.h"
#import "PLBusinessman.h"
#import "PLMyClass.h"

@interface PLAppDelegate ()

@property (strong, nonatomic) PLCovernment* covernment;
@property (strong, nonatomic) PLBusinessman* businessman;
@property (strong, nonatomic) PLDoctor* doctor;
@property (strong, nonatomic) PLPensioner* pensioner;
@property (strong, nonatomic) PLMyClass* myClass;

@end


@implementation PLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:PLCovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    self.covernment = [[PLCovernment alloc]init];
    
    self.businessman = [[PLBusinessman alloc] init];
    self.doctor = [[PLDoctor alloc] init];
    self.pensioner = [[PLPensioner alloc] init];
    
    self.myClass = [[PLMyClass alloc] init];
    
    
    PLDoctor* doctor = [[PLDoctor alloc]init];
    PLPensioner* pensioner = [[PLPensioner alloc]init];
    PLBusinessman* businessman = [[PLBusinessman alloc]init];
    
    
    self.businessman.name = @"BMan";
    self.doctor.name = @"Doctor";
    self.pensioner.name = @"Pensioner";
    
    
    doctor.salary = self.covernment.salary;
    pensioner.pension = self.covernment.pension;
    businessman.taxLevel=self.covernment.taxLevel;
    
    doctor.averagePrice = pensioner.averagePrice = businessman.averagePrice = self.covernment.averagePrice;
    
    self.covernment.salary = 1000;
    self.covernment.pension = 800;
    self.covernment.taxLevel=8;
    
    self.covernment.averagePrice=20;
    self.covernment.averagePrice=10;
    
    
    
    return YES;
}


- (void)governmentNotification:(NSNotification*) notification {
    //NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"It's appDelegate rules");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"It's appDelegate rules");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"It's appDelegate rules");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"It's appDelegate rules");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"It's appDelegate rules");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
