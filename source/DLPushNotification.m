//
//  DLSystem.m
//  DLApi
//
//  Created by Endel Dreyer on 5/20/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLPushNotification.h"

@implementation DLPushNotification

-(instancetype)initWithClient:(DLApi*)client
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _client = client;
    return self;
}

-(DLRequest*)register:(NSDictionary*)params
{
    /* device_id: register for push notification */
    /* app_name: get app name dynamically */
    /* app_version: get app version dynamically */
    /* platform: ios */

    return [_client POST:@"push/registration" parameters:@{@"data":params}];
}

@end
