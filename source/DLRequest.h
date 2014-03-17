//
//  DLRequest.h
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class DLRequest;
typedef void (^DLRequestBlock)(DLRequest *request);

@interface DLRequest : NSObject
@property(nonatomic, retain) NSString* method;
@property(nonatomic, retain) NSDictionary* data;
@property(nonatomic, retain) NSDictionary* headers;
@property(nonatomic, retain) NSString* url;
@property(nonatomic, retain) NSError* error;
@property(nonatomic, retain) id response;
@property(nonatomic, retain) AFHTTPRequestOperation* operation;
@property(nonatomic, copy) DLRequestBlock completionBlock;

- (void)execute;
- (instancetype)initWithURL:(NSString*)url;
- (void)setValue:(NSString*)value forHeader:(NSString *)header;
@end
