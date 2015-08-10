//
//  DSNewFemaleController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
// 最新女装
#import "DSNewFemaleController.h"

#define kFont 20

@interface DSNewFemaleController ()

@end

@implementation DSNewFemaleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"最新女装";
    
    // 初始化
    [self newFemale];
    
    /**
     *  返回箭头
     */
    [self backBtn];

}

- (void)backBtn
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

- (void)leftBtnBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)newFemale
{
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
    textView.text = @"\t夏奈尔最了解女人，夏奈尔的产品种类繁多，每个女人在夏奈尔的世界里总能找到合适自己的东西，在欧美上流女性社会中甚至流传着一句话“当你找不到合适的服装时，就穿夏奈尔套装”";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 180, 180, 250)];
    imgView.image = [UIImage imageNamed:@"newFemale.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}

@end
