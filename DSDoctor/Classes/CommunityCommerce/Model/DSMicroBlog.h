//
//  DSMicroBlog.h
//  DSDoctor
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSMicroBlog : NSObject
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *picture;

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *time;

// 来源
@property (nonatomic,copy) NSString *from;
// 点赞图标
@property (nonatomic,copy) NSString *praiseImg;
// 点赞数
@property (nonatomic,copy) NSString *praiseLabel;
// 消息图标
@property (nonatomic,copy) NSString *messageImg;
// 消息数
@property (nonatomic,copy) NSString *messageLabel;

@property (nonatomic,assign,getter=isVip) BOOL vip;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)microBlogWithDic:(NSDictionary *)dic;

+ (NSArray *)microBlogsList;
@end

