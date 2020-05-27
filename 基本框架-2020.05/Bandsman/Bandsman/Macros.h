//
//  Macros.h
//  Bandsman
//
//  Created by li que on 2020/5/27.
//  Copyright © 2020 UU. All rights reserved.
//

#ifndef Macros_h
#define Macros_h


//判断iPhone X、iPhone XS、iPhone XS Max、iPhone XR
#define IS_IPHONE_X_OR_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE_XR1 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE_XR2 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size) : NO)


#define IS_IPHONE_5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1136, 640), [[UIScreen mainScreen] currentMode].size) : NO)


#define IS_IPHONE_XS (IS_IPHONE_X_OR_XS ? IS_IPHONE_X_OR_XS : IS_IPHONE_XS_MAX)
//#define IS_IPHONE_X (IS_IPHONE_XS ? IS_IPHONE_XS : IS_IPHONE_XR)
//#define IS_IPHONE_X              (ScreenLongerSide == 812.0f)
#define IS_IPHONE_X              IS_IPHONE_X_OR_XS || IS_IPHONE_XS_MAX || IS_IPHONE_XR1 || IS_IPHONE_XR2 || (ScreenLongerSide == 812.0f)

#define IPHONE_NAVIGATIONBAR_HEIGHT  (IS_IPHONE_X ? 88 : 64)
#define IPHONE_STATUSBAR_HEIGHT      (IS_IPHONE_X ? 44 : 20)
#define IPHONE_SAFEBOTTOMAREA_HEIGHT (IS_IPHONE_X ? 34 : 0)
#define IPHONE_TOPSENSOR_HEIGHT      (IS_IPHONE_X ? 32 : 0)
#define IPHONE_TABBAR_HEIGHT         (IS_IPHONE_X ? 83 : 49)
#define kApplicationStatusBarHeight  [UIApplication sharedApplication].statusBarFrame.size.height //状态栏的高度

// 获取主屏幕的高度
#define kMainScreenHeight   ([UIScreen mainScreen].bounds.size.height)
// 获取主屏幕的宽度
#define kMainScreenWidth    ([UIScreen mainScreen].bounds.size.width)

#define kMainDevicesHeight   MAX((kMainScreenHeight), (kMainScreenWidth))//设备高
#define kMainDevicesWidth    MIN((kMainScreenHeight), (kMainScreenWidth))//设备宽

/** 屏幕长边 */
#define ScreenLongerSide ([UIScreen mainScreen].bounds.size.width>[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)

#define DebugLog() NSLog(@"%s %d", __PRETTY_FUNCTION__, __LINE__);

#define PlayTopHeight      (IS_IPHONE_X ? 44 : 20)

#define kWindow [[[UIApplication sharedApplication] delegate] window]

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define AppJsonVersion [NSString stringWithFormat:@"1.1.%@",[[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] stringByReplacingOccurrencesOfString:@"." withString:@""]]


#define APP_VERSION_EQUAL_TO(v) ([APP_VERSION compare:v options:NSNumericSearch] == NSOrderedSame)

#define APP_VERSION_GREATER_THAN(v) ([APP_VERSION compare:v options:NSNumericSearch] == NSOrderedDescending)
#define APP_VERSION_NOT_LESS_THAN(v) ([APP_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)

#define APP_VERSION_LESS_THAN(v) ([APP_VERSION compare:v options:NSNumericSearch] == NSOrderedAscending)
#define APP_VERSION_NOT_GREATER_THAN(v) ([APP_VERSION compare:v options:NSNumericSearch] != NSOrderedDescending)

#define SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]
#define SYSTEM_VERSION_EQUAL_TO(v) ([SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedSame)

#define SYSTEM_VERSION_GREATER_THAN(v) ([SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_NOT_LESS_THAN(v) ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN(v) ([SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_NOT_GREATER_THAN(v) ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedDescending)

#ifdef CGFLOAT_IS_DOUBLE
#define GF_EPSILON DBL_EPSILON
#define GF_MIN DBL_MIN
#else
#define GF_EPSILON FLT_EPSILON
#define GF_MIN FLT_MIN
#endif

#define gf_equal(a,b) (fabs((a) - (b)) < GF_EPSILON)
#define gf_equalZero(a) (fabs(a) < GF_EPSILON)

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#ifndef SYNTH_DUMMY_CLASS
#define SYNTH_DUMMY_CLASS(_name_) \
@interface SYNTH_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation SYNTH_DUMMY_CLASS_ ## _name_ @end
#endif

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

/** 提交一个任务在主线程中执行 */
static inline void dispatch_main_thread(void (^block)(void)) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

/** 字体 */
#define FontPFRegular(fsize)    [UIFont fontWithName:@"PingFangSC-Regular" size:fsize] ?: [UIFont systemFontOfSize:fsize]
#define FontPFMedium(fsize)        [UIFont fontWithName:@"PingFangSC-Medium" size:fsize] ?: [UIFont systemFontOfSize:fsize]
#define FontPFSemibold(fsize)        [UIFont fontWithName:@"PingFangSC-Semibold" size:fsize] ?: [UIFont systemFontOfSize:fsize]



#endif /* Macros_h */
