//
//  DSSelfTableViewCell.m
//  DSDoctor
//
//  Created by Chenghui on 15/4/25.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSSelfTableViewCell.h"
#import "DSSelfDiagnModel.h"

@interface DSSelfTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowsImg;

@end

@implementation DSSelfTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    DSSelfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DSSelfTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;

}

- (void)setSelfModel:(DSSelfDiagnModel *)selfModel
{
    _selfModel = selfModel;
    
    // 1、图片
    self.iconImg.image = [UIImage imageNamed:selfModel.icon];
    
    // 2、标题
    self.titleLabel.text = selfModel.title;
    
    // 3、箭头
    self.arrowsImg.image = [UIImage imageNamed:selfModel.arrow];
}

@end
