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

- (void)authenticate:(NSDictionary*)data usingProvider:(NSString*)provider block:(DLRequestBlock)block
{
    NSString *url = [NSString stringWithFormat:@"auth/%@", provider];
    [_client POST:url parameters:data block:block];
}

- (void)verify:(NSDictionary*)data usingProvider:(NSString*)provider block:(DLRequestBlock)block
{
    NSString *url = [NSString stringWithFormat:@"auth/%@/verify", provider];
    [_client POST:url parameters:data block:block];
}

- (void)forgotPassword:(NSDictionary*)data block:(DLRequestBlock)block
{
    [_client POST:@"auth/email/forgotPassword" parameters:data block:block];
}

- (void)resetPassword:(NSDictionary*)data block:(DLRequestBlock)block
{
    [_client POST:@"auth/email/resetPassword" parameters:data block:block];
}

- (void)logout
{
    
}

- (BOOL)hasAuthToken
{
    return _authToken != NULL;
}

@end
