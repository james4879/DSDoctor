//
//  UItableViewCellModel.h
//  YRSideViewController
//
//  Created by Chenghui on 15/4/23.
//  Copyright (c) 2015年 YueRuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UItableViewCellModel : NSObject

/**
 * 图片
 */
@property (nonatomic, copy) NSString *icon;

/**
 * 标题
 */
@property (nonatomic, copy) NSString *title;

/**
 * 箭头
 */
@property (nonatomic, copy) NSString *arrow;

+ (instancetype)cellInitWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
