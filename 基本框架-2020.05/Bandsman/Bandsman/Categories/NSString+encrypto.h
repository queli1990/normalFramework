//
//  NSString+encrypto.h
//  OV
//
//  Created by li que on 2019/4/10.
//  Copyright © 2019 li que. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (encrypto)

- (NSString *) md5;

- (NSString *)urlEncode;

@end

NS_ASSUME_NONNULL_END
