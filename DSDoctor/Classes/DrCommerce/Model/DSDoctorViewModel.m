//
//  DSDoctorViewModel.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/7.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSDoctorViewModel.h"

@implementation DSDoctorViewModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.doctorIcon = dict[@"doctorIcon"];
        self.doctorName = dict[@"doctorName"];
        self.doctorLev = dict[@"doctorLev"];
        self.doctorComment = dict[@"doctorComment"];
    }
    return self;
}

+ (instancetype)doctorWithDcit:(NSDictionary *)dict
{
    return [[super alloc] initWithDict:dict];
}

@end
