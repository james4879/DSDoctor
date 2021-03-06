//
//  DSNewsComModel.m
//  DSDoctor
//
//  Created by Chenghui on 15/4/25.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSNewsComModel.h"

@implementation DSNewsComModel

+ (instancetype)dsNewsWithDcit:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.newsIcon = dict[@"newsIcon"];
        self.newsTitle = dict[@"newsTitle"];
        self.newsDate = dict[@"newsDate"];
        self.newsComment = dict[@"newsComment"];
    }
    return self;
}

@end
