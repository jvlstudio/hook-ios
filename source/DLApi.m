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
    _auth = [[DLAuth alloc] initWithClient:self];
    _files = [[DLFiles alloc] initWithClient:self];
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
          success:(void (^)(DLRequest *request, id response))success
          failure:(void (^)(DLRequest *request, NSError* error))failure
{
    return [self requestWithMethod:@"GET" segments:segments parameters:params
                           success:success failure:failure];
}

- (DLRequest*)POST:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure
{
    return [self requestWithMethod:@"POST" segments:segments parameters:params
                           success:success failure:failure];

}

- (DLRequest*)PUT:(NSString*) segments
       parameters:(NSDictionary*)params
          success:(void (^)(DLRequest *request, id response))success
          failure:(void (^)(DLRequest *request, NSError* error))failure
{
    return [self requestWithMethod:@"PUT" segments:segments parameters:params
                           success:success failure:failure];

}

- (DLRequest*)DELETE:(NSString*) segments
             success:(void (^)(DLRequest *request, id response))success
             failure:(void (^)(DLRequest *request, NSError* error))failure
{
    return [self requestWithMethod:@"DELETE" segments:segments parameters:nil
                           success:success failure:failure];

}

- (DLRequest*)requestWithMethod:(NSString*)method
                       segments:(NSString*)segments
                     parameters:(NSDictionary*)params
                        success:(void (^)(DLRequest *request, id response))success
                        failure:(void (^)(DLRequest *request, NSError* error))failure
{
    NSString *url = [NSString stringWithFormat:@"%@/%@", _url, segments];
    DLRequest *request = [[DLRequest alloc] initWithURL:url];
    [request setMethod:method];
    [request setData:params];
    [request setValue:@"application/json" forHeader:@"Content-Type"];
    [request setValue:_appId forHeader:@"X-App-Id"];
    [request setValue:_key forHeader:@"X-App-Key"];
    
    if([_auth hasAuthToken]){
        [request setValue:_auth.authToken forKey:@"X-Auth-Token"];
    }
    
    [request setCompletionBlockWithSuccess:success failure:failure];
    [request start];
    return request;
}


@end
