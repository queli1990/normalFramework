//
//  UIView+AddShadeLayer.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "UIView+AddShadeLayer.h"

@implementation UIView (AddShadeLayer)

- (void) addLayerToView:(UIView *)targetView rect:(CGRect)layerFrame {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = layerFrame;
    //颜色分配:四个一组代表一种颜色(r,g,b,a)
    layer.colors = @[(__bridge id) [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0].CGColor,
                     (__bridge id) [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6].CGColor];
    //起始点
    layer.startPoint = CGPointMake(0.5, 0.15);
    //结束点
    layer.endPoint = CGPointMake(0.5, 0.85);
    [targetView.layer addSublayer:layer];
}


- (void) addLayerToView:(UIView *)targetView rect:(CGRect)layerFrame upColor:(UIColor *)orgColor downColor:(UIColor *)endColor {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = layerFrame;
    //颜色分配:四个一组代表一种颜色(r,g,b,a)
    layer.colors = @[(__bridge id) orgColor.CGColor,
                     (__bridge id) endColor.CGColor];
    //起始点
    layer.startPoint = CGPointMake(0.5, 0.15);
    //结束点
    layer.endPoint = CGPointMake(0.5, 0.85);
    [targetView.layer addSublayer:layer];
}

@end
