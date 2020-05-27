//
//  NSTimer+Timer.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "NSTimer+Timer.h"


@implementation NSTimer (Timer)

- (void)pauseTimer {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}


- (void)resumeTimer {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate date]];
}

- (void)stopTimer {
    if (![self isValid]) {
        return;
    }
    [self invalidate];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

+ (void)ov_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)scheduledTimer:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(ov_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)timer:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(ov_ExecBlock:) userInfo:[block copy] repeats:repeats];
}



@end
