//
//  NavigationController.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController () <UIGestureRecognizerDelegate>

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark 旋转屏幕相关

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    UIInterfaceOrientationMask orientation = [self.topViewController supportedInterfaceOrientations];
    return orientation;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark 状态栏相关

- (UIViewController *)childViewControllerForStatusBarStyle {

    UIViewController *topViewController = self.topViewController;

    return topViewController;
}
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

#pragma mark 入栈出栈相关
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0;
    [self.topViewController.view endEditing:YES];
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    [self.topViewController.view endEditing:YES];
    return [super popViewControllerAnimated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.interactivePopGestureRecognizer.enabled) {
        BOOL canInteractive = self.viewControllers.count > 1;
        return canInteractive;
    }

    return NO;
}


@end
