//
//  NavigationBar.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImage *bgImage = [UIImage imageWithColor:[UIColor colorWithHexString:@"f8f8f8"]];
        [self setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        
        UIImage *lineImage = [UIImage imageWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.08f] size:CGSizeMake(kScreenWidth, 0.5f)];
        [self setShadowImage:lineImage];
    }
    return self;
}

@end
