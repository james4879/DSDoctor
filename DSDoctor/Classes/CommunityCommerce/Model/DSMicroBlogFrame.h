//
//  DSMicroBlogFrame.h
//  DSDoctor
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 James. All rights reserved.
//

#define DSNameFont 15
#define DSTextFont 14
#define DSTitleFont 16
#define DSCellViewH 64

#import <UIKit/UIKit.h>

@class DSMicroBlog;

@interface DSMicroBlogFrame : NSObject
@property (nonatomic, strong) DSMicroBlog *microBlog;

@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect nameFrame;
@property (nonatomic, assign, readonly) CGRect vipFrame;
@property (nonatomic, assign, readonly) CGRect timeFrame;
@property (nonatomic, assign, readonly) CGRect titleFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGRect pictureFrame;

@property (nonatomic, assign, readonly) CGFloat rowHeight;

/**
 * 添加每个cell下面的视图的frame
 */

// UIView，用来包涵下面几个控件
@property (nonatomic, assign, readonly) CGRect cellViewFrame;

// 来源标签
@property (nonatomic, assign, readonly) CGRect fromViewFrame;
// 赞视图
@property (nonatomic, assign, readonly) CGRect praiseViewImgFrame;
// 点赞数
@property (nonatomic, assign, readonly) CGRect praiseLabelCountFrame;
// 评论图标
@property (nonatomic, assign, readonly) CGRect messageViewImgFrame;
// 评论数
@property (nonatomic, assign, readonly) CGRect messageViewCountFrame;

@end
