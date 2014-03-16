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

- (instancetype)where:(NSString*)field andValue:(id)value
{
    return [self where:field withOperation:@"=" andValue:value];
}

- (instancetype)where:(NSString*)field withOperation:(NSString*)operation andValue:(id)value
{
    NSArray *whereClause = [[NSArray alloc] initWithObjects:field, operation, value, nil];
    [_wheres addObject:whereClause];
    return self;
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
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    if(_limit != nil){
        [dict setObject:_limit forKey:@"limit"];
    }
    if(_offset != nil){
        [dict setObject:_offset forKey:@"offset"];
    }
    if(_wheres != nil && [_wheres count] > 0){
        [dict setObject:_wheres forKey:@"q"];
    }
    if(_ordering != nil && [_ordering count] > 0){
        [dict setObject:_ordering forKey:@"s"];
    }
    if(_group != nil && [_group count] > 0){
        [dict setObject:_group forKey:@"g"];
    }
    if(_options != nil){
        if([_options objectForKey:@"data"]){
            [dict setObject:[_options objectForKey:@"data"] forKey:@"d"];
        }
        
        if([_options objectForKey:@"first"]){
            [dict setObject:[_options objectForKey:@"first"] forKey:@"first"];
        }
        
        if([_options objectForKey:@"aggregation"]){
            [dict setObject:[_options objectForKey:@"aggregation"] forKey:@"aggr"];
        }
        if([_options objectForKey:@"operation"]){
            [dict setObject:[_options objectForKey:@"operation"] forKey:@"op"];
        }
    }
    
    [self reset]; //clear for future calls
    return dict;
}

@end
