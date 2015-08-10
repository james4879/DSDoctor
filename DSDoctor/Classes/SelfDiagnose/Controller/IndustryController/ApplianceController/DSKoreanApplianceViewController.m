//
//  DSKoreanApplianceViewController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//   韩式家电
#import "DSKoreanApplianceViewController.h"

#define kFont 20

@interface DSKoreanApplianceViewController ()

@end

@implementation DSKoreanApplianceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @" 韩式家电";
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
    textView.text = @"\t韩冰箱先后推出了抗菌冰箱、无氟无霜冰箱、软冷冻冰箱、光波增鲜冰箱、卡萨帝法式对开门、卡萨帝意式三门、卡萨帝六门冰箱等都是为满足用户需求而推出的新品。而每一次技术与产品创新的动力都源于对消费者需求的把握与满足”";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 200, 200)];
    imgView.image = [UIImage imageNamed:@"koreaWater.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}


@end
