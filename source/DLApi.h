//
//  DLApi.h
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLCollection.h"
#import "DLChannel.h"
#import "DLRequest.h"
#import "DLAuth.h"
#import "DLFiles.h"
#import "DLSystem.h"
#import "DLKeyValues.h"

@class DLCollection;
@class DLAuth;
@class DLFiles;
@class DLSystem;
@class DLKeyValues;
@class DLChannel;

@interface DLApi : NSObject

@property (readonly, strong) NSString *appId;
@property (readonly, strong) NSString *key;
@property (readonly, strong) DLAuth* auth;
@property (readonly, strong) DLFiles* files;
@property (readonly, strong) DLSystem* system;
@property (readonly, strong) DLKeyValues* keys;

- (instancetype)initWithKey:(NSString*)key andAppId:(NSString*)app;

- (DLCollection*)collection:(NSString*)name;

- (DLChannel*)channel:(NSString*)name withParams:(NSDictionary*)params;

- (DLRequest*)GET:(NSString*) segments
       parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
            failure:(void (^)(DLRequest *request, NSError* error))failure;

- (DLRequest*)POST:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure;

- (DLRequest*)PUT:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure;

- (DLRequest*)DELETE:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure;

- (DLRequest*)requestWithMethod:(NSString*)method
                       segments:(NSString*)segments
                     parameters:(NSDictionary*)params
                        success:(void (^)(DLRequest *request, id response))success
                        failure:(void (^)(DLRequest *request, NSError* error))failure;
@end
