//
//  AppDelegate.m
//  Household Draft
//
//  Created by Daniela Postigo on 10/16/12.
//  Copyright (c) 2012 Daniela Postigo. All rights reserved.
//

#import "AppDelegate.h"
#import "UIImage+Utils.h"
#import "UIColor+Utils.h"


@implementation AppDelegate


- (void) customizeAppearance {

    [[UITabBar appearance] setSelectionIndicatorImage: [[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage: [[UIImage alloc] init]];

    NSValue *size = [NSValue valueWithCGSize: CGSizeMake(0, 0.3)];
    [[UITabBarItem appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], UITextAttributeTextColor, [UIColor colorWithWhite: 1.0 alpha: 0.5], UITextAttributeTextShadowColor, size, UITextAttributeTextShadowOffset, [UIFont fontWithName: @"HelveticaNeue-Bold" size: 10.0], UITextAttributeFont, nil] forState: UIControlStateNormal];
    [[UITabBarItem appearance] setTitlePositionAdjustment: UIOffsetMake(0, 0)];
    [[UINavigationBar appearance] setBackgroundColor: [UIColor redColor]];
}


- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {

    //#ifdef TESTFLIGHT_ENABLED
    //    NSLog(@"is debug");
    //
    //    [TestFlight takeOff: TESTFLIGHT_TOKEN];
    //#endif

    [self customizeAppearance];
    return YES;
}


- (void) applicationWillResignActive: (UIApplication *) application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


- (void) applicationDidEnterBackground: (UIApplication *) application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void) applicationWillEnterForeground: (UIApplication *) application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void) applicationDidBecomeActive: (UIApplication *) application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void) applicationWillTerminate: (UIApplication *) application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
