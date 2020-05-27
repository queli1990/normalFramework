//
//  NSObject+CheckValue.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CheckValue)

/**
 *  @brief 检测自己是否是number
 *
 *  @return YES：是number
 */
- (BOOL)isNumber;

/**
 *  @brief 检测自己是否是字符串
 *
 *  @return YES：是自字符串
 */
- (BOOL)isString;

/**
 *  @brief 检测自己是否是非空字符串
 *
 *  @return YES：是非空字符串
 */
- (BOOL)isValidString;

/**
 *  @brief 检测自己是否是集合
 *
 *  @return YES：是集合
 */
- (BOOL)isArray;

/**
 *  @brief 检测自己是否是非空集合
 *
 *  @return YES：是非空集合
 */
- (BOOL)isValidArray;

/**
 *  @brief 检测自己是否是字典
 *
 *  @return YES：是字典
 */
- (BOOL)isDictionary;

/**
 *  @brief 检测自己是否是非空字典
 *
 *  @return YES：是非空字典
 */
- (BOOL)isValidDictionary;


/**
 检测自己是否是Set

 @return YES：是Set
 */
- (BOOL)isSet;

/**
 检查自己是否是非空Set

 @return YES：是否非空Set
 */
- (BOOL)isValidSet;

@end

NS_ASSUME_NONNULL_END
