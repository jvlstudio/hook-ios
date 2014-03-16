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
- (instancetype)init:(DLApi*)client withName:(NSString*)name;

- (void*)create:(NSDictionary*)params
          success:(void (^)(DLRequest *request, id response))success
          failure:(void (^)(DLRequest *request, NSError* error))failure;

- (void*)getWithSuccess:(void (^)(DLRequest *request, id response))success
        failure:(void (^)(DLRequest *request, NSError* error))failure;

- (void*)firstWithSuccess:(void (^)(DLRequest *request, id response))success
                failure:(void (^)(DLRequest *request, NSError* error))failure;

- (void*)firstOrCreate:(NSDictionary*)params
               success:(void (^)(DLRequest *request, id response))success
               failure:(void (^)(DLRequest *request, NSError* error))failure;

- (void*)countWithSuccess:(void (^)(DLRequest *request, id response))success
                  failure:(void (^)(DLRequest *request, NSError* error))failure;

- (void*)maxWithSuccess:(void (^)(DLRequest *request, id response))success
                  failure:(void (^)(DLRequest *request, NSError* error))failure;

- (void*)minWithSuccess:(void (^)(DLRequest *request, id response))success
                failure:(void (^)(DLRequest *request, NSError* error))failure;

/*
 
 public void create(JSONObject data, Responder responder)
 {
 JSONObject dataToPost = new JSONObject();
 try{
 dataToPost.put("data", data);
 
 }catch (JSONException exception){
 
 }
 
 client.post(this.segments, dataToPost, responder);
 }
 
 public void get(Responder responder)
 {
 client.get(this.segments, this.buildQuery(), responder);
 }
 
 public void first(Responder responder)
 {
 _options.first = true;
 this.get(responder);
 }
 
 public void firstOrCreate(Responder responder)
 {
 //TODO: implement firstOrCreate method
 throw new Error("Not implemented");
 }
 
 public void count(Responder responder)
 {
 _options.aggregation = new CollectionOptionItem("count", null, null);
 this.get(responder);
 }
 
 public void max(String field, Responder responder)
 {
 _options.aggregation = new CollectionOptionItem("max", field, null);
 this.get(responder);
 }
 
 public void min(String field, Responder responder)
 {
 _options.aggregation = new CollectionOptionItem("min", field, null);
 this.get(responder);
 }
 
 public void avg(String field, Responder responder)
 {
 _options.aggregation = new CollectionOptionItem("avg", field, null);
 this.get(responder);
 }
 
 
 public void sum(String field, Responder responder)
 {
 _options.aggregation = new CollectionOptionItem("sum", field, null);
 this.get(responder);
 }
 
 public void update(int id, JSONObject data, Responder responder)
 {
 JSONObject dataToPost = new JSONObject();
 try{
 dataToPost.put("data", data);
 
 }catch (JSONException exception){
 
 }
 client.post(this.segments + "/" + id, dataToPost, responder);
 }
 
 public void updateAll(JSONObject data, Responder responder)
 {
 _options.data = data;
 client.put(this.segments, this.buildQuery(), responder);
 }
 
 public void increment(String field, Object value, Responder responder)
 {
 _options.operation = new CollectionOptionItem("increment", field, value);
 client.put(this.segments, this.buildQuery(), responder);
 }
 
 public void decrement(String field, Object value, Responder responder)
 {
 _options.operation = new CollectionOptionItem("decrement", field, value);
 client.put(this.segments, this.buildQuery(), responder);
 }
 
 public void remove(int id, Responder responder)
 {
 client.remove(this.segments + "/" + id, responder);
 }
 
 public void drop(Responder responder)
 {
 client.remove(this.segments, responder);
 }*/
@end
