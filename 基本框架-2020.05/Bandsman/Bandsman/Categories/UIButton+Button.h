//
//  UIButton+Button.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 定义图片位置 */
typedef NS_ENUM (NSUInteger, ButtonImageStyle) {
    /** image在上，label在下 */
    ButtonImageStyleTop,
    /** image在左，label在右 */
    ButtonImageStyleLeft,
    /** image在下，label在上 */
    ButtonImageStyleBottom,
    /** image在右，label在左 */
    ButtonImageStyleRight
};

@interface UIButton (Button)

#pragma mark - 设置图片和文字的布局
/**
 *  @brief 设置button的titleLabel和imageView的布局样式，默认间距 5
 *
 *  @param style ButtonImageStyle
 */
- (void)layoutButtonWithImageStyle:(ButtonImageStyle)style;

/**
 *  @brief 设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style ButtonImageStyle
 *  @param space 间距
 */
- (void)layoutButtonWithImageStyle:(ButtonImageStyle)style
                             space:(CGFloat)space;

@end


