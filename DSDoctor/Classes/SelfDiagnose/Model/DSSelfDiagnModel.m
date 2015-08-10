//
//  DSSelfDiagnModel.m
//  DSDoctor
//
//  Created by Chenghui on 15/4/25.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSSelfDiagnModel.h"

@implementation DSSelfDiagnModel

- (instancetype)cellInitWithSelf:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.arrow = dict[@"arrow"];
    }
    return self;
}

+ (instancetype)selfWithDiagn:(NSDictionary *)dict
{
    return [[self alloc] cellInitWithSelf:dict];
}

@end
