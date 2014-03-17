//
//  DLRequest.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLRequest.h"
#import "AFNetworking.h"

@implementation DLRequest

- (instancetype)initWithURL:(NSString*)url{
    self = [super init];
    if (!self) {
        return nil;
    }
    _url = url;
    _headers = [[NSMutableDictionary alloc] init];
    return self;
}

- (void)execute
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableURLRequest* request = [[AFJSONRequestSerializer serializer] requestWithMethod:_method URLString:_url parameters:_data error:nil];
    
    for (NSString *key in [_headers allKeys]) {
        [request setValue:[_headers objectForKey:key] forHTTPHeaderField:key];
    }
    
    [manager HTTPRequestOperationWithRequest:request success:nil failure:nil];
}

- (void)setValue:(NSString*)value forHeader:(NSString *)header
{
    [_headers setValue:value forKey:header];
}

- (void)setCompletionBlockWithSuccess:(void (^)(DLRequest *request, id response))success
                              failure:(void (^)(DLRequest *request, NSError* error))failure
{
    
}

@end
