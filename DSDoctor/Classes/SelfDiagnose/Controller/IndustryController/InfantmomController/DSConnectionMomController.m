//
//  DSConnectionMomController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  精品母婴

#import "DSConnectionMomController.h"

#define kFont 20

@interface DSConnectionMomController ()

@end

@implementation DSConnectionMomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"精品母婴";
    
    // 初始化
    [self newFemale];
}

- (void)newFemale
{
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
    textView.text = @"\t衣服质地环保、柔软及吸湿性良好，颜色易以浅色为主，容易洗涤的全棉衣料。对服饰缝制工艺做了特殊的处理，质量超好哦！";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 180, 320, 200)];
    imgView.image = [UIImage imageNamed:@"collectionMom.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}

@end
