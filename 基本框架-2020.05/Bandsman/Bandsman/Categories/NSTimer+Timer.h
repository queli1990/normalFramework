//
//  NSTimer+Timer.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Timer)

- (void)pauseTimer;

- (void)resumeTimer;

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

- (void)stopTimer;

+ (NSTimer *)scheduledTimer:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

+ (NSTimer *)timer:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;



@end

NS_ASSUME_NONNULL_END
