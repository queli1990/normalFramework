//
//  OVKeepBGRunManager.h
//  OV
//
//  Created by li que on 2020/3/12.
//  Copyright © 2020 li que. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OVKeepBGRunManager : NSObject

+ (OVKeepBGRunManager *)shareManager;

/**
 开启后台运行
 */
- (void)startBGRun;

/**
 关闭后台运行
 */
- (void)stopBGRun;


@end

NS_ASSUME_NONNULL_END
