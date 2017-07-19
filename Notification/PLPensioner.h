//
//  PLPensioner.h
//  Notification
//
//  Created by Pavel on 13/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLPensioner : NSObject

@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (strong, nonatomic) NSString* name;

@end
