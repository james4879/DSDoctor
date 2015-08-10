//
//  DSSelfTableViewCell.h
//  DSDoctor
//
//  Created by Chenghui on 15/4/25.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSSelfDiagnModel;

@interface DSSelfTableViewCell : UITableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *  模型
 */
@property (nonatomic, strong) DSSelfDiagnModel *selfModel;
@end
