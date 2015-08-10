//
//  DSHangShiManController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  韩式男装
#import "DSHangShiManController.h"

#define kFont 20

@interface DSHangShiManController ()

@end

@implementation DSHangShiManController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    [self hangShiMan];
    
    self.title = @"韩式男装";
    
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

- (void)hangShiMan
{
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
    textView.text = @"\t ILC是韩国著名的跨国公司RED WOOD INTERNATIONAL CO,LTD的二线品牌。16年来公司以开拓、进取、创新的理念不断成长壮大。ILC充满热情、不断进取、大胆创新、她崇尚文化，追求有品位的生活。ILC目标客户群23－35岁之间的知性女性。ILC采用意大利、日本、韩国的高级面料，拥有韩国一流的生产线。中文为“国际奢华文化”。ILC走的是高档路线。";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 290, 210, 160)];
    imgView.image = [UIImage imageNamed:@"hanshi.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];

}

@end
