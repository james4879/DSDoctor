//
//  DSDoctorViewModel.h
//  DSDoctor
//
//  Created by Chenghui on 15/5/7.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSDoctorViewModel : NSObject
/**
 *  头像
 */
@property (nonatomic, copy) NSString *doctorIcon;

/**
 *  医生姓名
 */
@property (nonatomic, copy) NSString *doctorName;

/**
 *  职位级别
 */
@property (nonatomic, copy)NSString *doctorLev;

/**
 *  评论
 */
@property (nonatomic, copy)NSString *doctorComment;

+ (instancetype)doctorWithDcit:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
