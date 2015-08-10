//
//  DSSelfDiagnModel.h
//  DSDoctor
//
//  Created by Chenghui on 15/4/25.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSSelfDiagnModel : NSObject

/**
 *  图片
 */
@property (nonatomic, copy) NSString *icon;

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  箭头
 */
@property (nonatomic, copy) NSString *arrow;

- (instancetype)cellInitWithSelf:(NSDictionary *)dict;
+ (instancetype)selfWithDiagn:(NSDictionary *)dict;

@end
