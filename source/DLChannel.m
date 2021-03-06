//
//  DLChannel.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLChannel.h"

@implementation DLChannel
-(instancetype)initWithClient:(DLApi*)client
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _client = client;
    
    //TODO: implement Channel API
    @throw[NSException exceptionWithName:@"DLChannel" reason:@"Not implemented" userInfo:nil];
    return self;
}
@end
