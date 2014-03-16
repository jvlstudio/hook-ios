//
//  DLRequest.h
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLRequest : NSObject
@property(nonatomic, retain) NSString* method;
@property(nonatomic, retain) NSDictionary* data;
@property(nonatomic, retain) NSString* url;

- (void)start;
- (void)pause;
- (void)cancel;
- (instancetype)initWithURL:(NSString*)url;
- (void)setValue:(NSString*)value forHeader:(NSString *)header;
- (void)setCompletionBlockWithSuccess:(void (^)(DLRequest *request, id response))success
                              failure:(void (^)(DLRequest *request, NSError* error))failure;
@end
