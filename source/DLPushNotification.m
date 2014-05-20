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

-(DLRequest*)register:(NSData*)deviceToken
{
    const char* data = [deviceToken bytes];
    NSMutableString* token = [NSMutableString string];

    for (int i = 0; i < [deviceToken length]; i++) {
        [token appendFormat:@"%02.2hhX", data[i]];
    }

    NSString *deviceId = [token copy];

    NSDictionary *infoPList = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [infoPList objectForKey:@"CFBundleDisplayName"];
    NSString *appVersion = [infoPList objectForKey:@"CFBundleVersion"];

    NSMutableDictionary *postParams = @{
       @"app_name": appName,
       @"app_version": appVersion,
       @"device_id": deviceId
    };

    return [_client POST:@"push/registration" parameters:postParams];
}

@end
