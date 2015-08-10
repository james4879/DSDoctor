//
//  DSInfantMomViewController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  最新母婴产品
#import "DSInfantMomViewController.h"

#define kFont 20

@interface DSInfantMomViewController ()

@end

@implementation DSInfantMomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"最新母婴产品";
    
    // 初始化
    [self newFemale];
    
    // 左边导航栏
    [self backLeftNav];
}

- (void)backLeftNav
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backItemNav) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)backItemNav
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)newFemale
{
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
    textView.text = @"\t圣婴岛婴幼儿服饰引进国内外先进技术、设备，严格的质量控制体系，专业的技术管理制度确保了产品质量的稳定，完善的售后服务得到国内外用户的一致好评。”";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 180, 320, 250)];
    imgView.image = [UIImage imageNamed:@"newMom.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}

@end
