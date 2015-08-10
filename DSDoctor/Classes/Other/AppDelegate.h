//
//  AppDelegate.h
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSSideViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) DSSideViewController *sideViewController;

@end

