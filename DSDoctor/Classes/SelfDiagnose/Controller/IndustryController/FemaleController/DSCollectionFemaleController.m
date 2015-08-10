//
//  DSCollectionFemaleController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  精品女装

#import "DSCollectionFemaleController.h"

#define kFont 20
@interface DSCollectionFemaleController ()

@end

@implementation DSCollectionFemaleController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"精品女装";
    
    // 初始化
    [self manView];
    
    // 左边导航栏
    [self leftBackNav];
}

- (void)leftBackNav
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

- (void)manView {
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
    textView.text = @"\t精致朴素的，摒弃一切多余的细节，线条简练而完美，质感甚为重要，传统的纯棉是大多数时间的选择，面向20-35岁富有朝气与活力的都市时尚女性，融合都市时尚女性的个性休闲元素，与轻松、自由的互联网文化完美结合，在设计上注重细节变化和整体搭配，含蓄而不张扬，凸显新时代都市女性的独有气质与个性飞扬。";
        textView.editable = NO;
        textView.font = [UIFont fontWithName:@"Arial" size:kFont];
        [self.view addSubview:textView];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 265, 185, 230)];
        imgView.image = [UIImage imageNamed:@"collection.jpg"];
        imgView.backgroundColor = [UIColor blueColor];
        [textView addSubview:imgView];
}

@end
