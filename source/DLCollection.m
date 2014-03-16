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
    [self reset];
    return [self init];
}

- (void)getWithBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)getFirstWithBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)getFirstOrCreate:(NSDictionary*)params withBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)getMaxWithBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)getMinWithBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)getAvgWithBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)getSumWithBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)create:(NSDictionary*)params withBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)update:(int)itemId withParams:(NSDictionary*)params andBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)updateAll:(NSDictionary*)params withBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)remove:(int)itemId withBlock:(void (^)(DLRequest *request))block
{
    
}

- (void)dropWithBlock:(void (^)(DLRequest *request))block
{
    
}

- (instancetype)group:(NSString*)field
{
    [_group addObject:field];
    return self;
}

- (instancetype)groupWithArray:(NSArray*)fields
{
    int size = [fields count];
    for(int i = 0; i<size; i++){
        [_group addObject:[fields objectAtIndex:i]];
    }
    return self;
}

- (instancetype)sort:(NSString*)field withDirection:(int)direction
{
    NSDictionary *sortDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"field", field, @"direction", direction, nil];
    [_ordering addObject:sortDict];
    return self;
}

- (instancetype)sort:(NSString*)field withDirectionString:(NSString*)direction
{
    int num = [direction isEqualToString:@"asc"] ? 1 : -1;
    return [self sort:field withDirection:num];
}

- (instancetype)limit:(int)num
{
    _limit = [NSNumber numberWithInt:num];
    return self;
}

- (instancetype)offset:(int)num
{
    _offset = [NSNumber numberWithInt:num];
    return self;
}

- (void)reset
{
    _options = [[NSMutableDictionary alloc] init];
    _wheres = [[NSMutableArray alloc] init];
    _ordering = [[NSMutableArray alloc] init];
    _group = [[NSMutableArray alloc] init];
    _limit = nil;
    _offset = nil;
}

- (NSDictionary*)query
{
    [self reset];
    return nil;
}

@end
