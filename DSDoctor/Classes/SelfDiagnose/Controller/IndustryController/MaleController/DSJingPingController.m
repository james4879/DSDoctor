//
//  DSJingPingController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  精品男装
#import "DSJingPingController.h"

#define kFont 20

@interface DSJingPingController ()

@end

@implementation DSJingPingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    [self jingpinMan];
    
    self.title = @"精品男装";
    
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

- (void)jingpinMan
{
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.frame.size.height)];
    textView.text = @"\t红白蓝配色的笑脸与反战标识以波点元素的形式呈现，这些如有生命般的小点点们就像从打开的香槟瓶口喷洒而出的泡沫般，流露着极富幽默感的活力，以及俏皮和激情。笑脸与反战标识均是Life•After Life本季的代表性Logo，倡导积极、乐观的生活态度哦！";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 220, 180, 230)];
    imgView.image = [UIImage imageNamed:@"jingpin.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}

@end
