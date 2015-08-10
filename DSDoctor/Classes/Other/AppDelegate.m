//
//  AppDelegate.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "AppDelegate.h"
#import "DSMainController.h"
#import "DSProfileController.h"
#import "DSSideViewController.h"
#import "DSQuestionController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    // 定时器
    NSTimer *connectionTimer;
    BOOL done;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 等待1秒进入首页
    connectionTimer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:connectionTimer forMode:NSDefaultRunLoopMode];
    do{
        [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }while (!done);
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    
    DSMainController *mainViewController = [[DSMainController alloc]init];
    mainViewController.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    DSProfileController *profileController = [[DSProfileController alloc] init];
    UINavigationController *proNavigation = [[UINavigationController alloc] initWithRootViewController:profileController];
    profileController.view.backgroundColor = [UIColor whiteColor];
    
    DSQuestionController *rightViewController = [[DSQuestionController alloc] init];
    UINavigationController *rightNavigation = [[UINavigationController alloc] initWithRootViewController:rightViewController];
    rightViewController.view.backgroundColor = [UIColor whiteColor];
    
    _sideViewController=[[DSSideViewController alloc] init];
    _sideViewController.rootViewController = navigationController;
    _sideViewController.leftViewController = proNavigation;
    _sideViewController.rightViewController = rightNavigation;
    
    _sideViewController.leftViewShowWidth = 270;
    _sideViewController.needSwipeShowMenu = true;// 默认开启的可滑动展示
    
    self.window.rootViewController = _sideViewController;
    [self.window makeKeyAndVisible];

#warning 把框架的导航栏隐藏，然后，自定义
        navigationController.navigationBarHidden = YES;
//      navigationController.navigationBar.translucent = NO;
   
    return YES;
}

- (void)timerFired:(NSTimer *)timer
{
    done = YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
