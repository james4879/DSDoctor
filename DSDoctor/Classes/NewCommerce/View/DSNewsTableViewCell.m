//
//  DSNewsTableViewCell.m
//  DSDoctor
//
//  Created by Chenghui on 15/4/27.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSNewsTableViewCell.h"
#import "DSNewsComModel.h"

@interface DSNewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *newsIcon;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsDate;
@property (weak, nonatomic) IBOutlet UILabel *newsCommerce;

@end

@implementation DSNewsTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    DSNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib 加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DSNewsTableViewCell" owner:nil options:nil] lastObject];
        
    }
    return cell;
}

- (void)setNewsModel:(DSNewsComModel *)newsModel
{
    _newsModel = newsModel;
    
    // 图片
    self.newsIcon.image = [UIImage imageNamed:newsModel.newsIcon];
    
    // 标题
    self.newsTitle.text = newsModel.newsTitle;
    
    // 日期
    self.newsDate.text = newsModel.newsDate;
    
    // 评论
    self.newsCommerce.text = newsModel.newsComment;
}

@end
