//
//  NSFileManager+FileManager.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//


#import <Foundation/Foundation.h>

/**
 *  读取文件时候回调
 *
 *  @param data        可能是 array或者是dictionary
 *  @paramisSucceeded 是否成功
 */
typedef void(^LoadDataFromFileBlock)(id data, BOOL isSucceeded);


@interface NSFileManager (FileManager)

/**
 *  @brief 获取沙盒中documents的文件夹路径
 *
 *  @return 路径
 */
+ (NSString *)documentsPath;

/**
 *  @brief 获取沙盒中caches的文件夹路径
 *
 *  @return 路径
 */
+ (NSString *)cachesPath;

+ (NSUInteger)fileSizeWithPath:(NSString *)path;

+ (NSString *)tmpPath;

/**
 *  @brief 判断指定路径下的文件是否存在,是绝对路径
 *
 *  @param path 路径
 *
 *  @return YES：存在
 */
+ (BOOL)fileExistsAtAbsolutePath:(NSString *)path;

/**
 删除文件

 @param filePath 文件路径或者文件夹路径
 @return 是否删除成功
 */
+ (BOOL)removeFilePath:(NSString *)filePath;

/**
 *  同步从文件读取数组
 *
 *  @param path     路径 "documents/test/a.txt" 中的text
 *  @param fileName 路径 "documents/test/a.txt" 中的a.txt
 *  @param callback 回调
 *
 *  @return 是否成功
 */
+ (BOOL)asyncLoadArrayFromPath:(NSString *)path
                      fileName:(NSString *)fileName
                      callback:(LoadDataFromFileBlock)callback;




@end


