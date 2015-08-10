//
//  DSNewMaleController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSNewMaleController.h"
#define kFont 20

@interface DSNewMaleController ()

@end

@implementation DSNewMaleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"最新男装";
    
    // 初始化
    [self manView];
    
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

- (void)manView
{
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
    textView.text = @"\t近日，国际时尚男装空间konzen发布了2015早春新品印花系列lookbook。展望2015早春男装系列款式，趋势预测机构几款新兴印花款式。在新一季男装中，花卉以及森林主题风格印花频频出现，开创了男装领域的印花新风格。简单的花朵图案应用于干净的白色背景当中，这样简洁的画面中却饱含着充满活力、五彩缤纷的色调，充满现代感的花卉印花让服饰带上会呼吸的生命力量....";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 310, 230, 150)];
    imgView.image = [UIImage imageNamed:@"100142834_01_mb.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}

@end
