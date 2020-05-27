//
//  UIView+View.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "UIView+View.h"

static const char *ActionHandlerTapGestureKey;

@implementation UIView (View)

/**
 *  动态添加手势
 */

- (void)setTapActionWithBlock:(void (^)(void))block {

    self.userInteractionEnabled = YES;

    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &ActionHandlerTapGestureKey);

    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &ActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }

    objc_setAssociatedObject(self, &ActionHandlerTapGestureKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized)  {
        void(^action)(void) = objc_getAssociatedObject(self, &ActionHandlerTapGestureKey);
        if (action)  {
            action();
        }
    }
}

@end
