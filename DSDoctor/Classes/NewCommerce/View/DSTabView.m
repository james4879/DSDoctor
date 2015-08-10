//
//  DSTabView.m
//  DSDoctor
//
//  Created by Chenghui on 15/4/27.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSTabView.h"
#import "DSNewsTableViewCell.h"

@interface DSTabView ()

- (IBAction)btnClick:(UIButton *)sender;

@property (strong ,nonatomic) DSNewsTableViewCell *cellViewVC;

@end

@implementation DSTabView

+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DSTabView" owner:nil options:nil] lastObject];
}

- (IBAction)btnClick:(UIButton *)sender {
    NSInteger flag = sender.tag;
    switch (flag) {
        case 10:
        {
            DSLog(@"10");
        }
            break;
            
            case 20:
        {
            DSLog(@"20");

        }
            break;
            
        case 30:
            DSLog(@"30");
            break;
            
        case 40:
            DSLog(@"40");
            break;
            
        case 50:
            DSLog(@"50");
            break;
    }
}
@end
