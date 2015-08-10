//
//  DSDoctorViewCell.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/7.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSDoctorViewCell.h"

#import "DSDoctorViewModel.h"

@interface DSDoctorViewCell ()
// 医生头像
@property (weak, nonatomic) IBOutlet UIImageView *docImage;
// 医生姓名
@property (weak, nonatomic) IBOutlet UILabel *docName;
// 医生级别
@property (weak, nonatomic) IBOutlet UILabel *doctLve;
// 推荐指数
@property (weak, nonatomic) IBOutlet UILabel *doctComment;

@end

@implementation DSDoctorViewCell

//- (void)awakeFromNib {
//    [[[NSBundle mainBundle] loadNibNamed:@"DSDoctorViewCell" owner:nil options:nil] lastObject];
//}

+ (instancetype)cellDoctorWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    DSDoctorViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib 加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DSDoctorViewCell" owner:nil options:nil] lastObject];
        
    }
    return cell;
}

- (void)setDoctorModel:(DSDoctorViewModel *)doctorModel
{
    _doctorModel = doctorModel;
    
    // 修剪头像，使变圆
    _docImage.layer.cornerRadius = 40.0;
    _docImage.layer.masksToBounds = YES;

    // 医生头像
    self.docImage.image = [UIImage imageNamed:doctorModel.doctorIcon];
    // 医生姓名
    self.docName.text = doctorModel.doctorName;
    // 医生级别
    self.doctLve.text = doctorModel.doctorLev;
    // 推荐指数
    self.doctComment.text = doctorModel.doctorComment;
}

@end
