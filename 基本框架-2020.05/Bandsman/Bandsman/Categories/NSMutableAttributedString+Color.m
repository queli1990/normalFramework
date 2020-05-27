//
//  NSMutableAttributedString+Color.m
//  OV
//
//  Created by li que on 2019/4/12.
//  Copyright © 2019 li que. All rights reserved.
//

#import "NSMutableAttributedString+Color.h"

@implementation NSMutableAttributedString (Color)

+ (NSMutableAttributedString *)setupAttributeString:(NSString *)text rangeText:(NSString *)rangeText textColor:(UIColor *)color fontSize:(CGFloat)fontSize {
    
    NSRange hightlightTextRange = [text rangeOfString:rangeText];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 3; // 调整行间距
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, rangeText.length)];

    
    if (hightlightTextRange.length > 0) {
        [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:hightlightTextRange];
        [attributeStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontSize] range:hightlightTextRange];
        
        return attributeStr;
    } else {
        return [rangeText copy];
    }
}


+ (NSMutableAttributedString *)setupAttributeString:(NSString *)text rangeText:(NSString *)rangeText textColor:(UIColor *)color {
    
    NSRange hightlightTextRange = [text rangeOfString:rangeText];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (hightlightTextRange.length > 0) {
        [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:hightlightTextRange];
        [attributeStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15.0f] range:hightlightTextRange];
        return attributeStr;
    } else {
        return [rangeText copy];
    }
}

@end
