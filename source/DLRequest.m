//
//  DLRequest.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLRequest.h"

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
    NSError *serializeError = NULL;
    NSMutableURLRequest* request = [[AFJSONRequestSerializer serializer] requestWithMethod:_method URLString:_url parameters:_data error:&serializeError];
    
    if(serializeError != NULL){
        [self setError:serializeError];
        if(_completionBlock != NULL){
            _completionBlock(self);
        }else{
            NSLog(@"DLRequest serialization error: %@", serializeError);
        }
        return;
    }
    for (NSString *key in [_headers allKeys]) {
        [request setValue:[_headers objectForKey:key] forHTTPHeaderField:key];
    }
    
    NSLog(@"%@", _url);
    _operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self setError:nil];
        [self setResponse:responseObject];
        if(_completionBlock != nil){
            _completionBlock(self);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self setError:error];
        [self setResponse:[operation responseObject]];
        if(_completionBlock != nil){
            _completionBlock(self);
        }
    }];
    [_operation start];
}

- (void)setValue:(NSString*)value forHeader:(NSString *)header
{
    [_headers setValue:value forKey:header];
}

@end
