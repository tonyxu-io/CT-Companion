//
//  AppDelegate.m
//  CT Companion
//
//  Created by Tony Xu on 7/23/17.
//  Copyright © 2017 Tony Xu. All rights reserved.
//

#import "AppDelegate.h"
#import <ChatSDK/MXChatSDK.h>

#define str(x) @_str(x)
#define _str(x) #x

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"Moxtra:initializing Moxtra SDK");
    // Override point for customization after application launch.
    // Fill in the App Client ID and Client Secret Key received from the app registration step from Moxtra
    // Initialize Moxtra SDK
    NSString *APP_CLIENT_ID = @"jb4VnhAImtw";
    NSString *APP_CLIENT_SECRET = @"nBOic8KFjT0";
    NSString *APP_BASE_DOMAIN = @"sandbox.moxtra.com";
    NSString *YOUR_UNIQUE_ID = @"JaneDoe";
    NSString *YOUR_ORG_ID = @"P37xcpNhtEDCXTLl4bcRmDA";
    // Set the serverType to productionServer when pointing your app to production environment
//    [Moxtra clientWithApplicationClientID:APP_CLIENT_ID applicationClientSecret:APP_CLIENT_SECRET serverType: sandboxServer httpsDomain:nil wssDomain:nil];
    [[MXChatClient sharedInstance] linkWithUniqueId: YOUR_UNIQUE_ID orgId:YOUR_ORG_ID clientId:APP_CLIENT_ID clientSecret:APP_CLIENT_SECRET baseDomain:APP_BASE_DOMAIN completionHandler:^(NSError * _Nullable errorOrNil) {
        NSLog(@"Moxtra:initialized Moxtra SDK");
    }];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    // Handle url request.
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL Request" message:[url absoluteString] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alert show];
    NSLog(@"Moxtra:got cross launch");
    [self.myViewController startChat];
    return YES;
}


@end
