//
//  DSMicroBlog.m
//  DSDoctor
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 James. All rights reserved.
//

#import "DSMicroBlog.h"

@implementation DSMicroBlog
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        // KVC
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)microBlogWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)microBlogsList
{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"microblog" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        DSMicroBlog *microBlog = [DSMicroBlog microBlogWithDic:dic];
        [tmpArray addObject:microBlog];
    }
    return tmpArray;
}
@end
