//
//  DSNewsModel.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/5.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSNewsModel.h"

@implementation DSNewsModel

- (instancetype)cellInitWithSelf:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.leftLabel = dict[@"leftLabel"];
        self.middleLabel = dict[@"middleLabel"];
        self.arrow = dict[@"arrow"];
    }
    return self;
}

+ (instancetype)newsWithDiagn:(NSDictionary *)dict
{
    return [[self alloc] cellInitWithSelf:dict];
}

@end
