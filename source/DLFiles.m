//
//  DLFiles.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLFiles.h"

@implementation DLFiles
-(instancetype)initWithClient:(DLApi*)client
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _client = client;
    //TODO: Implement Files API
    @throw[NSException exceptionWithName:@"DLFiles" reason:@"Not implemented" userInfo:nil];
    return self;
}
@end
