//
//  UIControl+Control.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (Control)

/**
 设置点击区域 上下左右扩大一样距离

 @param size 扩大距离
 */
- (void)setEnlargeEdge:(CGFloat)size;

/**
 设置点击区域

 @param top top
 @param right right
 @param bottom bottom
 @param left left
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;


@end

NS_ASSUME_NONNULL_END
