//
//  DLKeyValues.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLKeyValues.h"

@implementation DLKeyValues
-(instancetype)initWithClient:(DLApi*)client
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _client = client;
    return self;
}

-(void)getValue:(NSString*)key block:(DLRequestBlock)block
{
    NSString *_url = [NSString stringWithFormat:@"key/%@", key];
    [_client GET:_url parameters:nil block:block];
}

-(void)setValue:(id)value forKey:(NSString*)key block:(DLRequestBlock)block
{
    NSString *_url = [NSString stringWithFormat:@"key/%@", key];
    [_client POST:_url parameters:@{@"data":value} block:block];
}
@end
