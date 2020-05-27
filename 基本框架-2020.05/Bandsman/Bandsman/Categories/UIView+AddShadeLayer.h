//
//  UIView+AddShadeLayer.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AddShadeLayer)

- (void) addLayerToView:(UIView *)targetView rect:(CGRect)layerFrame;

- (void) addLayerToView:(UIView *)targetView rect:(CGRect)layerFrame upColor:(UIColor *)orgColor downColor:(UIColor *)endColor;

@end

NS_ASSUME_NONNULL_END
