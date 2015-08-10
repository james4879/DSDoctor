//
//  DSDoctorViewCell.h
//  DSDoctor
//
//  Created by Chenghui on 15/5/7.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSDoctorViewModel;
@interface DSDoctorViewCell : UITableViewCell

+ (instancetype)cellDoctorWithTableView:(UITableView *)tableView;

/**
 *  模型
 */
@property (nonatomic, strong) DSDoctorViewModel *doctorModel;

@end
