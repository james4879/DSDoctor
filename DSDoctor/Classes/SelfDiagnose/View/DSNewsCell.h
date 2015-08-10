//
//  DSNewsCell.h
//  DSDoctor
//
//  Created by Chenghui on 15/5/5.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSNewsModel;

@interface DSNewsCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *  模型
 */
@property (nonatomic, strong) DSNewsModel *newsModel;

@end
