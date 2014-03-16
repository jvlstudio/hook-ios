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

@interface DLApi : NSObject

- (DLCollection*) collection:(NSString*) name;
- (DLChannel*) channel:(NSString*) name withParams:(NSDictionary*)params;
- (DLRequest*) requestWithMethod:(NSString*)method parameters:(NSDictionary*)params;

- (DLRequest*) GET:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
            failure:(void (^)(DLRequest *request, NSError* error))failure;

- (DLRequest*) GET:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure;

- (DLRequest*) POST:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure;

- (DLRequest*) PUT:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure;

- (DLRequest*) DELETE:(NSString*) segments
        parameters:(NSDictionary*)params
           success:(void (^)(DLRequest *request, id response))success
           failure:(void (^)(DLRequest *request, NSError* error))failure;
@end
