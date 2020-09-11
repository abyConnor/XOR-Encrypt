//
//  AppDelegate.m
//  EncDemo
//
//  Created by abyzhou on 2020/9/11.
//  Copyright © 2020 abyzhou. All rights reserved.
//

#import "AppDelegate.h"
#import "NSString+Encryption.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *enc = @"qazwsx123456";
    NSString *enPas = [enc xorencrypt];
    NSLog(@"enPas =====%@", enPas);

    NSString *pas = enPas;
    NSString *dec = [pas dxorencrypt];
    NSLog(@"dec =====%@", dec);
    return YES;
}

#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

@end
