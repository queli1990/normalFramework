//
//  UIButton+PicWordButton.m
//  OV
//
//  Created by li que on 2019/4/9.
//  Copyright © 2019 li que. All rights reserved.
//

#import "UIButton+PicWordButton.h"

@implementation UIButton (PicWordButton)

- (void)setButtonShowType:(RSButtonType)type itemGap:(CGFloat)gap{
    [self layoutIfNeeded];
    
    CGFloat labelWidth = self.titleLabel.bounds.size.width;
    CGFloat imageWidth = self.imageView.bounds.size.width;
    CGFloat imageHeight = self.imageView.bounds.size.height;
    CGFloat labelHeight = self.titleLabel.bounds.size.height;
    
    // 这里都计算完毕了，很简单，例如 imageWidth是A  labelWidth是B
    // 那么image要居中就要X轴移动 （A+B）/2 - A/2
    // label要居中就要X轴移动 （A+B）/2 - B/2
    // Y轴移动就直接除以2 然后加上间隙就好了
    // 图片中心对齐控件XY轴的偏移量
    CGFloat imageOffSetX = labelWidth / 2;
    CGFloat imageOffSetY = imageHeight / 2 + gap / 2;
    CGFloat labelOffSetX = imageWidth / 2;
    CGFloat labelOffSetY = labelHeight / 2 + gap / 2;
    
    switch (type) {
        case RSButtonTypeRight: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -gap / 2, 0, gap / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0 , - gap / 2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0, gap / 2);
        }
            break;
            
        case RSButtonTypeLeft: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0,labelWidth + gap / 2 , 0, -labelWidth - gap / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - gap / 2, 0, imageWidth+gap / 2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0, gap / 2);
        }
            break;
        case RSButtonTypeBottom: {
            // 上图下字
            // 让UIButton能保证边缘自适应 居中的时候需要
            // 当上下排布的时候，要根据edge来填充content大小
            CGFloat maxWidth = MAX(imageWidth,labelWidth); // 上下排布宽度肯定变小 获取最大宽度的那个
            CGFloat changeWidth = imageWidth + labelWidth - maxWidth; // 横向缩小的总宽度
            CGFloat maxHeight = MAX(imageHeight,labelHeight); // 获取最大高度那个 （就是水平默认排布的时候的原始高度）
            CGFloat changeHeight = imageHeight + labelHeight + gap - maxHeight; // 总高度减去原始高度就是纵向宽大宗高度
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffSetY, imageOffSetX, imageOffSetY, -imageOffSetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffSetY, -labelOffSetX, -labelOffSetY, labelOffSetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changeHeight - labelOffSetY, - changeWidth / 2, labelOffSetY, -changeWidth / 2);
        }
            break;
        case RSButtonTypeTop: {
            // 上字下图
            // 让UIButton能保证边缘自适应 居中的时候需要
            // 当上下排布的时候，要根据edge来填充content大小
            CGFloat maxWidth = MAX(imageWidth,labelWidth); // 上下排布宽度肯定变小 获取最大宽度的那个
            CGFloat changeWidth = imageWidth + labelWidth - maxWidth; // 横向缩小的总宽度
            CGFloat maxHeight = MAX(imageHeight,labelHeight); // 获取最大高度那个 （就是水平默认排布的时候的原始高度）
            CGFloat changeHeight = imageHeight + labelHeight + gap - maxHeight; // 总高度减去原始高度就是纵向宽大宗高度
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffSetY, imageOffSetX, -imageOffSetY, -imageOffSetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffSetY, -labelOffSetX, labelOffSetY, labelOffSetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(labelOffSetY, -changeWidth / 2, changeHeight - labelOffSetY, -changeWidth / 2);
        }
            break;
        default:
            break;
    }
}


@end
