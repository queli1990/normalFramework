//
//  NSFileManager+FileManager.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "NSFileManager+FileManager.h"

@implementation NSFileManager (FileManager)

static dispatch_queue_t _dispathQueue;

+ (dispatch_queue_t)defaultQueue {
    if (!_dispathQueue) {
        _dispathQueue = dispatch_queue_create("com.movies.mobile.NSFileManager", NULL);
    }
    return _dispathQueue;
}

+ (NSString *)documentsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths.firstObject;
}

+ (NSString *)cachesPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return paths.firstObject;
}

+ (NSString *)tmpPath {
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}

+ (NSUInteger)fileSizeWithPath:(NSString *)path {
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    unsigned long long length = [fileAttributes fileSize];
    return length;
}

+ (BOOL)fileExistsAtAbsolutePath:(NSString *)path {
//    NSParameterAssert([path isValidString]);

    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (BOOL)fileExistsAtDocumentsPath:(NSString *)path fileName:(NSString *)fileName {

//    NSParameterAssert([path isValidString]);
//    NSParameterAssert([fileName isValidString]);

    BOOL isExists = NO;

    NSString *docPath = [self documentsPath];
    NSString *absolutePath = [NSString stringWithFormat:@"%@/%@/%@", docPath, path, fileName];

    isExists = [self fileExistsAtAbsolutePath:absolutePath];

    return isExists;
}

+ (BOOL)removeFilePath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;

    [fileManager removeItemAtPath:filePath error:&error];
    if (!error) {
        return YES;
    }

    return NO;
}

+ (NSArray *)loadArrayFromFile:(NSString *)filename
                          path:(NSString *)directory {

    if (![filename isValidString]) return nil;

    NSString *path = [self documentsPath];

    if (directory != nil) {
        path = [NSString stringWithFormat:@"%@/%@", path, directory];
    }
    NSString *fn = [NSString stringWithFormat:@"%@/%@",path,filename];

    return [[NSArray alloc] initWithContentsOfFile:fn];
}

+ (BOOL)asyncLoadArrayFromPath:(NSString *)path
                      fileName:(NSString *)fileName
                      callback:(LoadDataFromFileBlock)callback {

    BOOL fileExist = [self fileExistsAtDocumentsPath:path fileName:fileName];
    dispatch_async([self defaultQueue], ^{
        NSArray *array = [self loadArrayFromFile:fileName path:path];
        if (callback) {
            callback(array, fileExist);
        }
    });

    return fileExist;
}

@end
