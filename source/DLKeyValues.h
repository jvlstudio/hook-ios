//
//  DLKeyValues.h
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLApi.h"

@class DLApi;

@interface DLKeyValues : NSObject
@property(readonly, assign) DLApi* client;
-(instancetype)initWithClient:(DLApi*)client;
-(void)getValue:(NSString*)key block:(DLRequestBlock)block;
-(void)setValue:(id)value forKey:(NSString*)key block:(DLRequestBlock)block;
@end
