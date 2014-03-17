//
//  DLApi.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLApi.h"

@implementation DLApi

- (instancetype)initWithURL:(NSString*) url key:(NSString*)key appId:(NSString*)appId
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _key = key;
    _appId = appId;
    _url = url;
    _auth = [[DLAuth alloc] initWithClient:self];
    //_files = [[DLFiles alloc] initWithClient:self];
    _keys = [[DLKeyValues alloc] initWithClient:self];
    _system = [[DLSystem alloc] initWithClient:self];
    
    return self;
}

- (DLCollection*)collection:(NSString*)name
{
    DLCollection *object = [[DLCollection alloc] init:self withName:name];
    return object;
}

- (DLChannel*)channel:(NSString*)name withParams:(NSDictionary*)params
{
    @throw[NSException exceptionWithName:@"DLApi.channel" reason:@"Not implemented" userInfo:nil];
    return nil;
}

- (DLRequest*)GET:(NSString*) segments
       parameters:(NSDictionary*)params
            block:(DLRequestBlock)block
{
    return [self requestWithMethod:@"GET" segments:segments parameters:params block:block];
}

- (DLRequest*)POST:(NSString*) segments
        parameters:(NSDictionary*)params
            block:(DLRequestBlock)block
{
    return [self requestWithMethod:@"POST" segments:segments parameters:params block:block];

}

- (DLRequest*)PUT:(NSString*) segments
       parameters:(NSDictionary*)params
            block:(DLRequestBlock)block
{
    return [self requestWithMethod:@"PUT" segments:segments parameters:params block:block];

}

- (DLRequest*)DELETE:(NSString*) segments block:(DLRequestBlock)block
{
    return [self requestWithMethod:@"DELETE" segments:segments parameters:nil block:block];

}

- (DLRequest*)requestWithMethod:(NSString*)method
                       segments:(NSString*)segments
                     parameters:(NSDictionary*)params
                          block:(DLRequestBlock)block
{
    NSString *url = [NSString stringWithFormat:@"%@/%@", _url, segments];
    DLRequest *request = [[DLRequest alloc] initWithURL:url];
    [request setMethod:method];
    [request setData:params];
    [request setValue:@"application/json" forHeader:@"Content-Type"];
    [request setValue:_appId forHeader:@"X-App-Id"];
    [request setValue:_key forHeader:@"X-App-Key"];
    
    if([_auth hasAuthToken]){
        [request setValue:_auth.authToken forHeader:@"X-Auth-Token"];
    }
    
    [request setCompletionBlock:block];
    [request execute];
    return request;
}


@end
