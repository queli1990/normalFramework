//
//  UIButton+PicWordButton.h
//  OV
//
//  Created by li que on 2019/4/9.
//  Copyright © 2019 li que. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RSButtonType) {
    RSButtonTypeRight = 0, // 图片在左边，文字在右边（默认的）
    RSButtonTypeLeft, // 图片在右边，文字在左边
    RSButtonTypeBottom, // 图片在上面，文字在下面
    RSButtonTypeTop // 文字在上面，图片在下面
};


@interface UIButton (PicWordButton)

/**
 *  设置button中title的位置
 *
 *  @param type type位置类型
 *
 *  !!! 此方法必须在给定frame之后调用
 */

- (void)setButtonShowType:(RSButtonType)type itemGap:(CGFloat)gap;

@end

NS_ASSUME_NONNULL_END
