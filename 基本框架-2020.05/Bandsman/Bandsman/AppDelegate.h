//
//  AppDelegate.h
//  Bandsman
//
//  Created by li que on 2020/5/21.
//  Copyright © 2020 UU. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RootViewController.h"
#import "LaunchViewController.h"
#import "StartupViewController.h"
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic,strong,readonly) RootViewController *rootViewController;

@property (nonatomic,strong,readonly) LaunchViewController *launchViewController;         // 0
@property (nonatomic,strong,readonly) StartupViewController *startupViewController;       // 1
@property (nonatomic,strong,readonly) MainViewController *mainViewController;             // 2

@property (strong, nonatomic) UIWindow *window;

+ (instancetype)instance;
- (void)setSkipViewControllerAtIndex:(NSInteger)index;
- (void)switchNextRootViewController;

@end

