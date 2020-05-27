//
//  StartupViewController.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "StartupViewController.h"
#import "AppDelegate.h"

@implementation StartupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[AppDelegate instance] switchNextRootViewController];
}

- (void)viewDidDisappear:(BOOL)animated {

}

- (void)umStatisticsBeginLogPage {

}

- (void)umStatisticsEndLogPage {

}




@end
