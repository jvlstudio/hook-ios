//
//  DLAuth.h
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLApi.h"

@class DLApi;

@interface DLAuth : NSObject

@property(readonly, assign) DLApi* client;
@property(readonly, assign) NSString* authToken;

- (instancetype)initWithClient:(DLApi*)client;
- (BOOL)hasAuthToken;
- (void)authenticate:(NSDictionary*)data usingProvider:(NSString*)provider block:(DLRequestBlock)block;
- (void)verify:(NSDictionary*)data usingProvider:(NSString*)provider block:(DLRequestBlock)block;;
- (void)forgotPassword:(NSDictionary*)data block:(DLRequestBlock)block;
- (void)resetPassword:(NSDictionary*)data block:(DLRequestBlock)block;
- (void)logout;

@end
