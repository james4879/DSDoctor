//
//  DSNewsTableViewCell.h
//  DSDoctor
//
//  Created by Chenghui on 15/4/27.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSNewsComModel;

@interface DSNewsTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 * 模型
 */
@property (nonatomic, strong) DSNewsComModel *newsModel;
@end
