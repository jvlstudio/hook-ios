//
//  DLRequest.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLRequest.h"

@implementation DLRequest

- (instancetype)initWithURL:(NSString*)url{
    self = [super init];
    if (!self) {
        return nil;
    }
    _url = url;
    return self;
}

- (void)start
{
    
}

- (void)setValue:(NSString*)value forHeader:(NSString *)header
{
    
}

- (void)setCompletionBlockWithSuccess:(void (^)(DLRequest *request, id response))success
                              failure:(void (^)(DLRequest *request, NSError* error))failure
{
    
}

@end
