//
//  NSDate+Date.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "NSDate+Date.h"

@implementation NSDate (Date)

+ (NSTimeInterval)getNowTimeInterval {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}

@end
