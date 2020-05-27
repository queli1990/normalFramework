//
//  LaunchViewController.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "LaunchViewController.h"
#import "AppDelegate.h"
#import "View+MASAdditions.h"


@interface LaunchViewController()
@property (nonatomic, strong) UIImageView *launchImageView;
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"此处可以加开屏前的处理");
    
    self.launchImageView = [[UIImageView alloc] init];
    if (IS_IPHONE_X || IS_IPHONE_XS) {
        self.launchImageView.image = [UIImage imageNamed:@"open_x"];
    } else {
        self.launchImageView.image = [UIImage imageNamed:@"open"];
    }
    [self.view addSubview:self.launchImageView];
    
    [self.launchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[AppDelegate instance] switchNextRootViewController];
}

@end
