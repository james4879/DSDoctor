//
//  DSTabBarView.h
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSTabBarView;

@protocol DSTabBarViewDelegate <NSObject>

@optional
- (void)tabBar:(DSTabBarView *)tabBar didSelectedBtnAtIndex:(NSInteger)index;

@end

@interface DSTabBarView : UIView

// 保存每个按钮的tabBarItem模型
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) id <DSTabBarViewDelegate> delegate;

@end
