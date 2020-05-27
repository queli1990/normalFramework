//
//  OVUMClick.m
//  OV
//
//  Created by 邵仕宇 on 2019/7/24.
//  Copyright © 2019 li que. All rights reserved.
//

#import "OVUMClick.h"

@implementation OVUMClick

+ (void)umClickWithEventId:(NSString *)eventId {
    if ([eventId isValidString]) {
        [MobClick event:eventId];
    }
}

+ (void)umEventWithEventId:(NSString *)eventId param:(NSDictionary *)param {
    if ([eventId isValidString]) {
        [MobClick event:eventId attributes:param];
    }
}

+ (void)umSetCrashReportEnabled:(BOOL)enabled {
    [MobClick setCrashReportEnabled:enabled];
}

+ (void)umSetScenarioType:(eScenarioType)type {
    [MobClick setScenarioType:type];
}

+ (void)umBeginLogPageView:(NSString *)pageName {
    if ([pageName isValidString]) {
        [MobClick beginLogPageView:pageName];
    }
}

+ (void)umEndLogPageView:(NSString *)pageName {
    if ([pageName isValidString]) {
        [MobClick endLogPageView:pageName];
    }
}

+ (void)umEventDetailEventWithParam:(NSDictionary *)param {
    if ([param isValidDictionary]) {
        [MobClick event:@"Detail_event" attributes:param];
    }
}

@end
