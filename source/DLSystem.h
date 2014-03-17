//
//  DLSystem.h
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLApi.h"

@class DLApi;

@interface DLSystem : NSObject
@property(readonly, assign) DLApi* client;
-(instancetype)initWithClient:(DLApi*)client;
-(void)getTimeWithBlock:(DLRequestBlock)block;
@end
