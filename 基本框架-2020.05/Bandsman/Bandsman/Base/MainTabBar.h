//
//  MainTabBar.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "TabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainTabBar : TabBar

@property (nonatomic, strong, readonly) UILabel *homeBadge;
@property (nonatomic, strong, readonly) UILabel *newsBadge;

@property (nonatomic, strong, readonly) UIButton *homeButton;
@property (nonatomic, strong, readonly) UIButton *discoverButton;
@property (nonatomic, strong, readonly) UIButton *publishButton;
@property (nonatomic, strong, readonly) UIButton *newsButton;
@property (nonatomic, strong, readonly) UIButton *profileButton;

+ (instancetype)mainTabBarWithHandler:(void (^)(id sender))handler;
- (void)setSelectButtonAtIndex:(NSInteger)index;
- (void)setBadgeNumber:(NSUInteger)number atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
