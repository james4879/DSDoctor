//
//  UItableViewCellModel.m
//  YRSideViewController
//
//  Created by Chenghui on 15/4/23.
//  Copyright (c) 2015年 YueRuo. All rights reserved.
//

#import "UItableViewCellModel.h"

@implementation UItableViewCellModel

+ (instancetype)cellInitWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.arrow = dict[@"arrow"];
    }
    return self;
}

@end
