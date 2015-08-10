//
//  DSNewsCell.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/5.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSNewsCell.h"
#import "DSNewsModel.h"

@interface DSNewsCell ()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImg;

@end
@implementation DSNewsCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    DSNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib 加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DSNewsCell" owner:nil options:nil] lastObject];
        
    }
    return cell;
}

- (void)setNewsModel:(DSNewsModel *)newsModel
{
    _newsModel =  newsModel;
    // 1、左边的文字
    self.leftLabel.text = newsModel.leftLabel;
    
    // 2、标题
    self.middleLabel.text = newsModel.middleLabel;
    
    // 3、箭头
    self.arrowImg.image = [UIImage imageNamed:newsModel.arrow];

}

@end
