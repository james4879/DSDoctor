//
//  DSNewsModel.h
//  DSDoctor
//
//  Created by Chenghui on 15/5/5.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSNewsModel : NSObject

/**
 *  左边标题
 */
@property (nonatomic, copy) NSString *leftLabel;

/**
 *  标题
 */
@property (nonatomic, copy) NSString *middleLabel;

/**
 *  箭头
 */
@property (nonatomic, copy) NSString *arrow;

- (instancetype)cellInitWithSelf:(NSDictionary *)dict;
+ (instancetype)newsWithDiagn:(NSDictionary *)dict;

@end
