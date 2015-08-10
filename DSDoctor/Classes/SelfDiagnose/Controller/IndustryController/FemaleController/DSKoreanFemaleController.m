//
//  DSKoreanFemaleController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  韩式女装
#import "DSKoreanFemaleController.h"

#define kFont 20

@interface DSKoreanFemaleController ()

@end

@implementation DSKoreanFemaleController

- (void)viewDidLoad {

    [super viewDidLoad];

    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"韩式女装";
    
    // 初始化
    [self manView];
    
    // 导航栏左边
    [self leftNav];
}

- (void)leftNav
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backLeftNav) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)backLeftNav
{
    [self.navigationController popViewControllerAnimated:YES];
}
    
- (void)manView
    {
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
        textView.text = @"\tSZ是韩国时下最受欢迎、人气最旺的时尚女装大品牌，广受韩国白领、明星及名媛青睐的高档品牌，也是多为韩国一线明星的长年服饰赞助商.体现出品牌主流的时尚与另类角度。韩国SZ品牌服饰是韩国时下最受欢迎的服饰品牌，被喻为“服装中的收藏品”。";
        textView.editable = NO;
        textView.font = [UIFont fontWithName:@"Arial" size:kFont];
        [self.view addSubview:textView];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 220, 190, 240)];
        imgView.image = [UIImage imageNamed:@"koreanFemale.jpg"];
        imgView.backgroundColor = [UIColor blueColor];
        [textView addSubview:imgView];
    }

@end
