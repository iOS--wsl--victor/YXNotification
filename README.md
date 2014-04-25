# YXNotification

This class is used for sharing messages between controllers. You can send message from one controller to other controllers ,no matter if they are exist or not.

 * Easy to use
 * When you register one controller, you do not have to remove it




### How to use

 * Import the header and inherit the protrol
 
```
#import "YXNotification.h"
@interface RootViewController ()<YXNotificationProtrol>
```
 * Implement the method
 
```
+ (void)listenEvent:(id)obj
{
    // do something here.
}
```
 * Register
 
```
    // register
    [YXNotification delegate:self mark:@"RootViewController"];
```
 * Send messages
 
```
    // send messages
    [YXNotification message:@"data"
                       from:self
                    toMarks:@[@"AnotherViewController"]];
```

Use it for fun :)
