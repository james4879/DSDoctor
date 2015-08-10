//
//  DSKoreanInfantmomController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  韩式母婴
#import "DSKoreanInfantmomController.h"

#define kFont 20

@interface DSKoreanInfantmomController ()

@end

@implementation DSKoreanInfantmomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"韩式母婴";
    
    // 初始化
    [self newFemale];
}

- (void)newFemale
{
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
    textView.text = @"\t 宝宝皮肤细嫩，脆弱，衣服用料宜柔软，吸水性，透气性较好的棉布或棉毛织品为宜，选择本服饰时不仅可以美观，耐用，肥瘦，先试穿一下是否合适。。。我们只做最优的产品！”";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 180, 260, 250)];
    imgView.image = [UIImage imageNamed:@"KoreanMom.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}

@end
