//
//  DLCollection.h
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLApi.h"

@class DLApi;

@interface DLCollection : NSObject
- (instancetype)init:(DLApi*)client withName:(NSString*)name;
@end
