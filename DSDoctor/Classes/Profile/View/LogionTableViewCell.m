//
//  LogionTableViewCell.m
//  YRSideViewController
//
//  Created by Chenghui on 15/4/23.
//  Copyright (c) 2015年 YueRuo. All rights reserved.
//

#import "LogionTableViewCell.h"
#import "UItableViewCellModel.h"


@interface LogionTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightImg;
@property (weak, nonatomic) IBOutlet UILabel *centerlabel;

@end

@implementation LogionTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    LogionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LogionTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setLogionModel:(UItableViewCellModel *)logionModel
{
    _logionModel = logionModel;
    
    // 1、图片
    self.leftImg.image = [UIImage imageNamed:logionModel.icon];
    
    // 2.标题
    self.centerlabel.text = logionModel.title;
    
    // 3.箭头
    self.rightImg.image = [UIImage imageNamed:logionModel.arrow];
}

@end
