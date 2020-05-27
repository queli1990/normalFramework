//
//  BaseModel.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


+ (instancetype)parseToModel:(NSDictionary *)dictionary {
    return [[self class] mj_objectWithKeyValues:dictionary];
}

- (NSDictionary *)toDictionary {
    if (self == nil) {
        return nil;
    }

    NSDictionary *dict = [self mj_keyValues];

    return dict;
}

+ (NSArray *)parseWithDictArray:(NSArray *)dictArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];

    for (NSDictionary *dict in dictArray) {
        [array addObject:[[self class] parseToModel:dict]];
    }

    return array;
}

+ (NSArray *)parseWithModelArray:(NSArray *)modelArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (BaseModel *model in modelArray) {
        [array addObject:[model toDictionary]];
    }

    return array;
}



@end
