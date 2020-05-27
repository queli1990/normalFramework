//
//  NSMutableAttributedString+Color.h
//  OV
//
//  Created by li que on 2019/4/12.
//  Copyright © 2019 li que. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Color)

/// 有行间距，不可以设置label的对齐方式
+ (NSMutableAttributedString *)setupAttributeString:(NSString *)text rangeText:(NSString *)rangeText textColor:(UIColor *)color fontSize:(CGFloat)fontSize;

/// 没有行间距，设置的label的对齐方式
+ (NSMutableAttributedString *)setupAttributeString:(NSString *)text rangeText:(NSString *)rangeText textColor:(UIColor *)color;


@end

NS_ASSUME_NONNULL_END
