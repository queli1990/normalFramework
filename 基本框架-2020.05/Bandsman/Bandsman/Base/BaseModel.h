//
//  BaseModel.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

+ (instancetype)parseToModel:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

+ (NSArray *)parseWithDictArray:(NSArray *)dictArray;

+ (NSArray *)parseWithModelArray:(NSArray *)modelArray;




@end

NS_ASSUME_NONNULL_END
