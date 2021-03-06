//
//  DLAuth.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLAuth.h"

NSString* const AUTH_TOKEN_KEY = @"dl-api-auth-token";
NSString* const AUTH_DATA_KEY = @"dl-api-auth-data";

@implementation DLAuth
- (instancetype)initWithClient:(DLApi*)client
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _client = client;
    _authTokenKey = [NSString stringWithFormat:@"%@-%@", _client.appId, AUTH_TOKEN_KEY];
    _authDataKey = [NSString stringWithFormat:@"%@-%@", _client.appId, AUTH_DATA_KEY];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:_authDataKey]){
        NSData *encodedUser = [defaults objectForKey:_authDataKey];
        _authToken = [[defaults objectForKey:_authTokenKey] objectForKey:@"token"];
        [self registerUser:[NSKeyedUnarchiver unarchiveObjectWithData:encodedUser]];
    }
    return self;
}

- (void)authenticate:(NSDictionary*)data usingProvider:(NSString*)provider block:(DLRequestBlock)block
{
    NSString *url = [NSString stringWithFormat:@"auth/%@", provider];
    [_client POST:url parameters:data block:^(DLRequest *request){
        if([request error] == NULL){
            [self registerAuthToken:[request response]];
        }
        if(block != NULL){
            block(request);
        }
    }];
}

- (void)verify:(NSDictionary*)data usingProvider:(NSString*)provider block:(DLRequestBlock)block
{
    NSString *url = [NSString stringWithFormat:@"auth/%@/verify", provider];
    [_client POST:url parameters:data block:^(DLRequest *request){
        if([request error] == NULL){
            [self registerAuthToken:[request response]];
        }
        if(block != NULL){
            block(request);
        }
    }];
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
    [self registerUser:nil];
}

- (void)registerUser:(NSDictionary*)data
{
    _user = data;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(_user == NULL){
        [defaults removeObjectForKey:_authTokenKey];
        [defaults removeObjectForKey:_authDataKey];
        _authToken = nil;
    }else{
        NSData *encodedData = [NSKeyedArchiver archivedDataWithRootObject:data];
        [defaults setObject:encodedData forKey:_authDataKey];
    }
    
    [defaults synchronize];
}

- (void)registerAuthToken:(NSDictionary*)data
{
    if([data objectForKey:@"token"]){
        NSDictionary *tokenDict = [data objectForKey:@"token"];
        _authToken = [tokenDict objectForKey:@"token"];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:tokenDict forKey:_authTokenKey];
        [defaults synchronize];
        [self registerUser:data];
    }
}

- (BOOL)hasAuthToken
{
    return _authToken != NULL;
}

@end
