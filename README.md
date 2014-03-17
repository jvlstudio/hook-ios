dl-api-ios
===

dl-api iOS client

#About

This is a port of the [JavaScript client](http://github.com/doubleleft/dl-api-javascript). The library is a native iOS library. We use [AFNetworking](https://github.com/AFNetworking/AFNetworking) for handling HTTP requests to dl-api's REST interface.

#Testing
- Go to `xcode` folder
- If you don't have CocoaPods installed, run: `sudo gem install cocoapods`
- Run `pod install` 
- Use `open DLApi.xcworkspace` to open the project

#How to Use

### Setup
```objc
DLApi *api = [[DLApi alloc] initWithURL:@"http://dl-api.ddll.co" key:@"q1uU7tFtXnLad6FIGGn2cB+gxcx64/uPoDhqe2Zn5AE=" appId:@"1"];
```

### Create Collection Item
```objc
NSDictionary* dict = @{@"name" : @"Gabriel", @"age" : [NSNumber numberWithInt:25]};
[[api collection:@"ios"] create:dict withBlock:^(DLRequest* request){
    if([request error] == NULL){
        NSLog(@"whoa! %@", [request response]);
    }else{
        NSLog(@"error! %@", [request response]);
    }
}];
```

### Fetching (and filtering) items
```objc
[[[api collection:@"ios"] where:@"age" andValue:[NSNumber numberWithInt:30]] getWithBlock:^(DLRequest* request){
    NSLog(@"filtering %@", [request response]);
}];
```

### Other available methods
- `sort`
- `where`
- `limit`
- `offset`
- `increment`
- `decrement`
- `avg`
- `max`
- `min`
- `sum`
- See [DLCollection header](https://github.com/doubleleft/dl-api-ios/blob/master/source/DLCollection.h) for better reference

### Authentication: create user
*TBD*

### Authentication: create user w/ Facebook
*TBD*

### Authentication: login user
*TBD*

### Authentication: other methods
- `forgotPassword`
- `resetPassword`
- `logout`
- `getAuthToken`
- `hasAuthToken`
- See [DLAuth header](https://github.com/doubleleft/dl-api-ios/blob/master/source/DLAuth.h) for better reference

