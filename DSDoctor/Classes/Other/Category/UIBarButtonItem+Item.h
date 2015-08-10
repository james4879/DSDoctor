//
//  UIBarButtonItem+Item.h
//  JJWeibo
//
//  Created by James on 3/5/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

/** 自定义导航栏按钮 */
+ (UIBarButtonItem *)barButtonItem:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action forControlEvent:(UIControlEvents)controlEvents;

@end
