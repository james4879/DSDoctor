//
//  DSMicroBlogCell.h
//  DSDoctor
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSMicroBlogFrame;
@interface DSMicroBlogCell : UITableViewCell

@property (nonatomic, strong) DSMicroBlogFrame *microBlogFrame;

+ (instancetype)microBlogCellWithTableView:(UITableView *)tableView;
@end
