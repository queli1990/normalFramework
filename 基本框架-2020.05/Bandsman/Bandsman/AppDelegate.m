//
//  AppDelegate.m
//  Bandsman
//
//  Created by li que on 2020/5/21.
//  Copyright © 2020 UU. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic,strong,readwrite) RootViewController *rootViewController;
@property (nonatomic,strong,readwrite) LaunchViewController *launchViewController;         // 0
@property (nonatomic,strong,readwrite) StartupViewController *startupViewController;       // 1
@property (nonatomic,strong,readwrite) MainViewController *mainViewController;             // 2

@property (atomic, strong) NSMutableArray<NSNumber *> *indexesOfViewControllersToShow;

@end

@implementation AppDelegate

+ (instancetype)instance {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)setSkipViewControllerAtIndex:(NSInteger)index {
    @synchronized (self) {
        id objectToRemove = nil;
        for (NSNumber * obj in self.indexesOfViewControllersToShow) {
            if ([obj integerValue] == index) {
                objectToRemove = obj;
                break;
            }
        }
        if (objectToRemove) {
            [self.indexesOfViewControllersToShow removeObject:objectToRemove];
        }
    }
}

- (void)switchNextRootViewController {
    @synchronized (self) {
        NSInteger currentViewControllerIndex = [self.rootViewController.viewControllers indexOfObject:self.rootViewController.selectedViewController];
        
        for (NSInteger index = 0; index < self.indexesOfViewControllersToShow.count; index++) {
            NSNumber *obj = [self.indexesOfViewControllersToShow objectAtIndex:index];
            if ([obj integerValue] == currentViewControllerIndex) {
                NSInteger nextIndex = index + 1;
                if (nextIndex < self.indexesOfViewControllersToShow.count) {
                    NSNumber *nextObj = [self.indexesOfViewControllersToShow objectAtIndex:nextIndex];
                    NSInteger nextViewControllerIndex = [nextObj integerValue];
                    [self.rootViewController switchToViewController:nextViewControllerIndex withCompletionBlock:^{
                        
                    }];
                    break;
                }
            }
        }
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self initRootViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)initRootViewController {
    
    self.launchViewController = [[LaunchViewController alloc] init];
    self.startupViewController = [[StartupViewController alloc] init];
    self.mainViewController = [[MainViewController alloc] init];
    self.rootViewController = [[RootViewController alloc]
                               initWithViewControllers:@[
                                                         self.launchViewController,
                                                         self.startupViewController,
                                                         self.mainViewController
                                                         ]];
    self.indexesOfViewControllersToShow = [[NSMutableArray alloc] initWithArray:@[@(0), @(1), @(2)]];
    self.window.rootViewController = self.rootViewController;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}


//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
