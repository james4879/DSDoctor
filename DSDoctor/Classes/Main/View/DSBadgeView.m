//
//  DSBadgeView.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSBadgeView.h"

#define JJBadgeViewFont [UIFont systemFontOfSize:11]

@implementation DSBadgeView

/**  初始化控件  */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置背景图片
//        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = JJBadgeViewFont;
        [self sizeToFit]; 
    }
    return self;
}

/** 重写setter方法,给属性赋值 */
- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    
    CGSize size = [badgeValue sizeWithAttributes:@{NSFontAttributeName:JJBadgeViewFont}];
    NSLog(@"-->%f--->%f", size.width, self.width);
    //判断按钮的文字的宽度大于按钮宽度
    if (size.width > self.width) {
        [self setTitle:nil forState:UIControlStateNormal];
//        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    } else {
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
//        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
    }
}

@end
