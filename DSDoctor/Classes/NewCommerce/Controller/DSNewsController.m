//
//  DSNewsController.m
//  DSDoctor
//
//  Created by Chenghui on 15/4/27.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSNewsController.h"

@interface DSNewsController ()

//@property (nonatomic, weak) UIWebView *webView;

@end

@implementation DSNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(btnBack)];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    
//    UIWebView *webView = [[UIWebView alloc] init];
//    webView.frame = self.view.frame;
//    NSURL *url = [NSURL URLWithString:@"http://bbs.paidai.com/topic/368297"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
//    [self.view addSubview:webView];
//    self.webView = webView;
    
    UIView *newsView = [[UIView alloc] init];
    newsView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    newsView.backgroundColor = [UIColor grayColor];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    textView.text = @"title";
    [newsView addSubview:textView];
    [self.view addSubview:newsView];
}

//- (void)refresh
//{
//    [self.webView reload];
//}

- (void)btnBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
