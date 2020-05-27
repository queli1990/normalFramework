//
//  MainViewController.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "MainViewController.h"
#import "MainTabBar.h"
#import "VC1.h"
#import "VC2.h"
#import "VC3.h"
#import "VC4.h"
#import "VC5.h"

@interface MainViewController()

@property (nonatomic, strong) MainTabBar *mainTabBar;

@property (nonatomic, strong) VC1              *vc1;
@property (nonatomic, strong) VC2             *vc2;
@property (nonatomic, strong) VC3           *vc3;
@property (nonatomic, strong) VC4           *vc4;

@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.vc1 = [[VC1 alloc] init];
    self.vc2 = [[VC2 alloc] init];
    self.vc3 = [[VC3 alloc] init];
    self.vc4 = [[VC4 alloc] init];
    
    
    NavigationController *nav1 = [[NavigationController alloc] init];
    nav1.viewControllers = @[self.vc1];
    NavigationController *nav2 = [[NavigationController alloc] init];
    nav2.viewControllers = @[self.vc2];
    NavigationController *nav3 = [[NavigationController alloc] init];
    nav3.viewControllers = @[self.vc3];
    NavigationController *nav4 = [[NavigationController alloc] init];
    nav4.viewControllers = @[self.vc4];
    
    self.viewControllers = @[nav1, nav2, nav3, nav4];
    
    @weakify(self)
    self.mainTabBar = [MainTabBar mainTabBarWithHandler:^(id sender) {
        @strongify(self)
        UIButton *button = (UIButton *)sender;
        [self didSelectTabBarButton:button];
    }];
    [self setValue:self.mainTabBar forKey:@"tabBar"];
    
    [self switchToViewControllerAtIndex:0];
}

- (void)didSelectTabBarButton:(UIButton *)button {
    
    if (button == self.mainTabBar.homeButton) {
        if (self.selectedViewController == [self.viewControllers objectAtIndex:0]) {
//            [self.homeViewController scrollToTopAndReloadData];
        } else {
            self.selectedIndex = 0;
        }
    } else if (button == self.mainTabBar.discoverButton) {
        if (self.selectedViewController != [self.viewControllers objectAtIndex:1]) {
            self.selectedIndex = 1;
        }
    } else if (button == self.mainTabBar.publishButton) {
//        [GFAccountManager checkLoginStatusCompletion:^(BOOL isLogin, GFUserMTL *user, BOOL justLogin) {
//            if (isLogin) {
//                GFPublishViewController *publishViewController = [[GFPublishViewController alloc] init];
//                [self presentViewController:publishViewController animated:YES completion:NULL];
//            }
//        }];
        
    } else if (button == self.mainTabBar.newsButton) {
        if (self.selectedViewController == [self.viewControllers objectAtIndex:2]) {
//            [self.newsViewController scrollToTopAndReloadData];
        } else {
            self.selectedIndex = 2;
        }
    } else if (button == self.mainTabBar.profileButton) {
        if (self.selectedViewController == [self.viewControllers objectAtIndex:3]) {
//            [self.profileViewController scrollToTopAndReloadData];
        } else {
            self.selectedIndex = 3;
        }
    }
}


- (void)switchToViewControllerAtIndex:(NSInteger)index {
    self.selectedIndex = index;
    [self.mainTabBar setSelectButtonAtIndex:index];
}

@end
