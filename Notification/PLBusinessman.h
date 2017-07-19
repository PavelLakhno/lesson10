//
//  PLBusinessman.h
//  Notification
//
//  Created by Pavel on 28/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLBusinessman : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat influcian;
@property (strong, nonatomic) NSString* name;

@end
