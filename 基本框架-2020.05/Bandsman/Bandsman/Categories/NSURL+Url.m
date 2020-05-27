//
//  NSURL+Url.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "NSURL+Url.h"

@implementation NSURL (Url)

+ (NSURL *)URLWithString:(NSString *)string {
    NSURL *url= [NSURL URLWithString:string];
    if (!url) {
        NSString* encodedString = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        url = [NSURL URLWithString:encodedString];
    }
    if (!url) {
        url = [NSURL URLWithString:[string urlEncode]];
    }
    return url;
}

@end
