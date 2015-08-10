//
//  DSCollectionApplianceViewController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/6.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  精品家电

#import "DSCollectionApplianceViewController.h"

#define kFont 20

@interface DSCollectionApplianceViewController ()

@end

@implementation DSCollectionApplianceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"精品家电";
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
    textView.text = @"\t家用电器使人们从繁重、琐碎、费时的家务劳动中解放出来，为人类创造了更为舒适优美、更有利于身心健康的生活和工作环境，提供了丰富多彩的文化娱乐条件，已成为现代家庭生活的必需品。家用电器问世已有近百年历史，本导航为您提供优质的电器，值得参考！”";
    textView.editable = NO;
    textView.font = [UIFont fontWithName:@"Arial" size:kFont];
    [self.view addSubview:textView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 230, 250, 250)];
    imgView.image = [UIImage imageNamed:@"collectionApple.jpg"];
    imgView.backgroundColor = [UIColor blueColor];
    [textView addSubview:imgView];
}


@end
