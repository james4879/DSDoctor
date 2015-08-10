//
//  DSTabTextCommentView.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/4.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  底部评论

#import "DSTabTextCommentView.h"

@implementation DSTabTextCommentView

+ (instancetype)commentView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DSTabTextCommentView" owner:nil options:nil] lastObject];
}

@end
