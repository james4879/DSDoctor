//
//  HeaderView.m
//  YRSideViewController
//
//  Created by Chenghui on 15/4/23.
//  Copyright (c) 2015年 YueRuo. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()

/**
 *  用户头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *login;

/**
 *  用户ID
 */
@property (weak, nonatomic) IBOutlet UILabel *userID;

/**
 *  用户等级
 */
@property (weak, nonatomic) IBOutlet UILabel *userLV;

/**
 *  用户金币
 */
@property (weak, nonatomic) IBOutlet UILabel *userMoney;

/**
 * 提问历史
 */
- (IBAction)askBtn:(id)sender;

@property (nonatomic, weak) UIView *bgView;

@property (nonatomic, weak) UIButton *backBtn;

/**
 * 我的医生
 */
- (IBAction)myDoc:(id)sender;

@end

@implementation HeaderView

+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
}

- (IBAction)askBtn:(id)sender {
   
    if ([self.delegate respondsToSelector:@selector(headerView:)]) {
        
        [self.delegate headerView:self];
    }
    NSLog(@"%s", __func__);
}


- (IBAction)myDoc:(id)sender {
    NSLog(@"%s", __func__);
}
@end
