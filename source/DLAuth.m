//
//  DLAuth.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLAuth.h"

@implementation DLAuth
- (instancetype)initWithClient:(DLApi*)client
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _client = client;
    return self;
}

- (BOOL)hasAuthToken
{
    return _authToken != NULL;
}

@end
