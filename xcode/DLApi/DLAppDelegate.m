//
//  DLAppDelegate.m
//  DLApi
//
//  Created by Gabriel Laet on 3/16/14.
//  Copyright (c) 2014 Doubleleft. All rights reserved.
//

#import "DLAppDelegate.h"
#import "DLApi.h"

@implementation DLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    DLApi *api = [[DLApi alloc] initWithURL:@"http://dl-api.ddll.co" key:@"q1uU7tFtXnLad6FIGGn2cB+gxcx64/uPoDhqe2Zn5AE=" appId:@"1"];
    
    
    //Create
    NSDictionary* dict = @{@"name" : @"Gabriel", @"age" : [NSNumber numberWithInt:25]};
    [[api collection:@"ios"] create:dict withBlock:^(DLRequest* request){
        if([request error] == NULL){
            NSLog(@"whoa! %@", [request response]);
        }else{
            NSLog(@"error! %@", [request response]);
        }
    }];
    
    //Fetch first
//    [[api collection:@"test"] getFirstWithBlock:^(DLRequest* request){
//        NSLog(@"getFirst %@", [request response]);
//    }];
    
    //Filtering
//    [[[api collection:@"ios"] where:@"age" andValue:[NSNumber numberWithInt:30]] getWithBlock:^(DLRequest* request){
//        NSLog(@"filtering %@", [request response]);
//    }];
//    
    //Sorting
//    [[[api collection:@"ios"] sort:@"created_at" withDirectionString:@"desc"] getWithBlock:^(DLRequest* request){
//        NSLog(@"sorting %@", [request response]);
//    }];
    
    
    //Auth
//    [api.auth authenticate:@{@"email":@"gabriel@doubleleft.com", @"password":@"12345"} usingProvider:@"email" block:^(DLRequest* request){
//        NSLog(@"auth-register %@", [request response]);
//    }];
//    
    
//    [api.auth verify:@{@"email":@"gabriel@doubleleft.com", @"password":@"12345"} usingProvider:@"email" block:^(DLRequest* request){
//        NSLog(@"auth-verify %@", [request response]);
//    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
