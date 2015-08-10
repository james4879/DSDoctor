//
//  HeaderView.h
//  YRSideViewController
//
//  Created by Chenghui on 15/4/23.
//  Copyright (c) 2015年 YueRuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeaderView;


@protocol HeaderViewDelegate <NSObject>
@optional 
+ (void)headerView:(HeaderView *)headerView;

@end
@interface HeaderView : UIView
+ (instancetype)headerView;

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

@end
