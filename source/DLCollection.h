//
//  DLCollection.h
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLApi.h"
#import "DLRequest.h"

@class DLApi;

@interface DLCollection : NSObject

@property(readonly, assign) DLApi* client;
@property(readonly, assign) NSString* name;
@property(readonly, assign) NSString* segments;
@property(readonly, strong) NSMutableDictionary* options;
@property(readonly, strong) NSMutableArray* wheres;
@property(readonly, strong) NSMutableArray* ordering;
@property(readonly, strong) NSMutableArray* group;
@property(readonly, strong) NSNumber* limit;
@property(readonly, strong) NSNumber* offset;

- (instancetype)init:(DLApi*)client withName:(NSString*)name;
- (void)reset;
- (NSDictionary*)query;
- (void)optionsOperation:(NSString*)method withField:(NSString*)field andValue:(id)value;
- (void)optionsAggregation:(NSString*)method withField:(NSString*)field;

- (void)getWithBlock:(void (^)(DLRequest *request))block;
- (void)getFirstWithBlock:(void (^)(DLRequest *request))block;
- (void)getFirstOrCreate:(NSDictionary*)params withBlock:(void (^)(DLRequest *request))block;

- (void)increment:(NSString*)field value:(id)value withBlock:(void (^)(DLRequest *request))block;
- (void)decrement:(NSString*)field value:(id)value withBlock:(void (^)(DLRequest *request))block;
- (void)count:(NSString*)field withBlock:(void (^)(DLRequest *request))block;
- (void)min:(NSString*)field withBlock:(void (^)(DLRequest *request))block;
- (void)max:(NSString*)field withBlock:(void (^)(DLRequest *request))block;
- (void)avg:(NSString*)field withBlock:(void (^)(DLRequest *request))block;
- (void)sum:(NSString*)field withBlock:(void (^)(DLRequest *request))block;

- (void)create:(NSDictionary*)params withBlock:(void (^)(DLRequest *request))block;
- (void)update:(int)itemId withParams:(NSDictionary*)params andBlock:(void (^)(DLRequest *request))block;
- (void)updateAll:(NSDictionary*)params withBlock:(void (^)(DLRequest *request))block;
- (void)remove:(int)itemId withBlock:(void (^)(DLRequest *request))block;
- (void)dropWithBlock:(void (^)(DLRequest *request))block;

- (instancetype)where:(NSString*)field andValue:(id)value;
- (instancetype)where:(NSString*)field withOperation:(NSString*)operation andValue:(id)value;
- (instancetype)group:(NSString*)field;
- (instancetype)groupWithArray:(NSArray*)fields;
- (instancetype)sort:(NSString*)field withDirection:(int)direction;
- (instancetype)sort:(NSString*)field withDirectionString:(NSString*)direction;
- (instancetype)limit:(int)num;
- (instancetype)offset:(int)num;

@end
