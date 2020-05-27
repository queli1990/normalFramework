//
//  OVUMClick.h
//  OV
//
//  Created by 邵仕宇 on 2019/7/24.
//  Copyright © 2019 li que. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMAnalytics/MobClick.h>

/**
 友盟统计打点
 */
@interface OVUMClick : NSObject

/**
 计数事件

 @param eventId  友盟官网上定义的时间id
 */
+ (void)umClickWithEventId:(NSString *)eventId;

/**
 计数事件

 @param eventId 友盟官网上定义的时间id
 @param param 需要统计的字段 key-value形式
 */
+ (void)umEventWithEventId:(NSString *)eventId param:(NSDictionary *)param;

/**
 开启CrashReport收集, 默认YES(开启状态).
 @param enabled 设置为NO,可关闭友盟CrashReport收集功能.
 */
+ (void)umSetCrashReportEnabled:(BOOL)enabled;

/**
 设置 统计场景类型，默认为普通应用统计：E_UM_NORMAL
 */
+ (void)umSetScenarioType:(eScenarioType)type;

/** 自动页面时长统计, 开始记录某个页面展示时长.
 使用方法：必须配对调用beginLogPageView:和endLogPageView:两个函数来完成自动统计，若只调用某一个函数不会生成有效数据。
 在该页面展示时调用beginLogPageView:，当退出该页面时调用endLogPageView:
 @param pageName 统计的页面名称.
 */
+ (void)umBeginLogPageView:(NSString *)pageName;

/** 自动页面时长统计, 结束记录某个页面展示时长.
 使用方法：必须配对调用beginLogPageView:和endLogPageView:两个函数来完成自动统计，若只调用某一个函数不会生成有效数据。
 在该页面展示时调用beginLogPageView:，当退出该页面时调用endLogPageView:
 @param pageName 统计的页面名称.
 */
+ (void)umEndLogPageView:(NSString *)pageName;

/**
 详情页面点击事件打点统计
 */
+ (void)umEventDetailEventWithParam:(NSDictionary *)param;

@end
