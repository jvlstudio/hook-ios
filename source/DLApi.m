//
//  DLApi.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLApi.h"

@implementation DLApi

- (instancetype)initWithKey:(NSString*)key andAppId:(NSString*)app
{
    self = [super init];
    if (!self) {
        return nil;
    }
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
    return nil;
}

- (DLRequest*)POST:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure
{
    return nil;
}

- (DLRequest*)PUT:(NSString*) segments
       parameters:(NSDictionary*)params
          success:(void (^)(DLRequest *request, id response))success
          failure:(void (^)(DLRequest *request, NSError* error))failure
{
    return nil;
}

- (DLRequest*)DELETE:(NSString*) segments
          parameters:(NSDictionary*)params
             success:(void (^)(DLRequest *request, id response))success
             failure:(void (^)(DLRequest *request, NSError* error))failure
{
    return nil;
}

- (DLRequest*)requestWithMethod:(NSString*)method
                       segments:(NSString*)segments
                     parameters:(NSDictionary*)params
                        success:(void (^)(DLRequest *request, id response))success
                        failure:(void (^)(DLRequest *request, NSError* error))failure
{
    return nil;
}


@end
