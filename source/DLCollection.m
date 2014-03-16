//
//  DLCollection.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLCollection.h"

@implementation DLCollection

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}


- (instancetype)init:(DLApi*)client withName:(NSString*)name
{
    _client = client;
    _name = name;
    return [self init];
}

@end
