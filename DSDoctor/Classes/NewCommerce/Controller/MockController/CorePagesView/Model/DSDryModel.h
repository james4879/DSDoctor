//
//  DSDryModel.h
//  DSDoctor
//
//  Created by Chenghui on 15/4/29.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  干货
#import <Foundation/Foundation.h>

@interface DSDryModel : NSObject
/**
 *  头像
 */
@property (nonatomic, copy) NSString *newsIcon;

/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *newsTitle;

/**
 *  新闻发布日期
 */
@property (nonatomic, copy)NSString *newsDate;

/**
 *  评论
 */
@property (nonatomic, copy)NSString *newsComment;

+ (instancetype)dsNewsWithDcit:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
