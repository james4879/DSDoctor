//
//  DSApplianceNewViewController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  最新家电
#import "DSApplianceNewViewController.h"

#define kFont 20

@interface DSApplianceNewViewController ()

@end

@implementation DSApplianceNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"最新家电";
    self.view.backgroundColor = [UIColor whiteColor];
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
    textView.text = @"\t每天重新梳理了能贴合网络购物特点的页面风格、采购体系、物流规划、商品清单、页面设计、购物流程、支付手段、配送售后等新的购物体验，努力为用户营造轻松、和谐、愉悦的购物环境，不断丰富品牌类型，优化产品结构，不仅为顾客提供家电类产品，而且，实时跟新最新电器哦！”";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 270, 100, 100)];
    imgView.image = [UIImage imageNamed:@"Apple.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}

@end
