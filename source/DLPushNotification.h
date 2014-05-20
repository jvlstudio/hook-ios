//
//  DLSystem.h
//  DLApi
//
//  Created by Endel Dreyer on 5/20/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLApi.h"

@class DLApi;

@interface DLSystem : NSObject
@property(readonly, assign) DLApi* client;
-(instancetype)initWithClient:(DLApi*)client;
-(DLRequest*)register;
@end

