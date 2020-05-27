//
//  TabBar.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "TabBar.h"

@implementation TabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    self.translucent = NO;
    Class TabBarButtonClass = NSClassFromString(@"UITabBarButton");
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:TabBarButtonClass]) {
            [subview removeFromSuperview];
        }
    }
}

@end
