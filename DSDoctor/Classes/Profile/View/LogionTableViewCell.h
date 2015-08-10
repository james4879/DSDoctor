//
//  LogionTableViewCell.h
//  YRSideViewController
//
//  Created by Chenghui on 15/4/23.
//  Copyright (c) 2015年 YueRuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UItableViewCellModel;

@interface LogionTableViewCell : UITableViewCell

/**
 *  通过一个tableView来创建一个cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *  模型
 */
@property (nonatomic, strong) UItableViewCellModel *logionModel;

@end
