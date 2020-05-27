//
//  TabBarViewController.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//设置样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

//设置是否隐藏
- (BOOL)prefersStatusBarHidden {
    return NO;
}
- (UIViewController *)childViewControllerForStatusBarStyle{
    return [self topMostViewController];
}
- (UIViewController *)childViewControllerForStatusBarHidden{
    return [self topMostViewController];
}
//设置隐藏动画
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}


- (BOOL)shouldAutorotate
{
    if ([self topMostViewController]) {
        return [[self topMostViewController] shouldAutorotate];
    }
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([self topMostViewController]) {
        return [[self topMostViewController]supportedInterfaceOrientations];
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    if ([self topMostViewController]) {
        return [[self topMostViewController]preferredInterfaceOrientationForPresentation];
    }
    return UIInterfaceOrientationPortrait;
    
}

- (UIViewController *)topMostViewController{
    UIViewController *currentVC = self.selectedViewController;
    if ([currentVC isKindOfClass:[NavigationController class]]) {
        NavigationController *nav = (NavigationController *)currentVC;
        return nav.topViewController;
    }
    return currentVC;
}
- (UIViewController *)childViewControllerForHomeIndicatorAutoHidden{
    return [self topMostViewController];
}

@end
