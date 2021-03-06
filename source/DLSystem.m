//
//  DLSystem.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLSystem.h"

@implementation DLSystem

-(instancetype)initWithClient:(DLApi*)client
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _client = client;
    return self;
}

-(void)getTimeWithBlock:(DLRequestBlock)block
{
    [_client GET:@"system/time" parameters:nil block:block];
}

@end
