//
//  DSNextController.m
//  DSDoctor
//
//  Created by James on 4/27/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSNextController.h"
#import "DSTabTextCommentView.h"

#import "TYMActivityIndicatorView.h"

@interface DSNextController ()

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UITextView *textView;

// logo图片
@property (nonatomic, strong) TYMActivityIndicatorView *activityIndicatorView2;

@end

@implementation DSNextController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [MBProgressHUD showMessage:@"正在加载..."];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];
//    });
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"最新销售";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
    
    // 隐藏标签栏
    self.tabBarController.tabBar.hidden = YES;
    
    // 初始化
    [self initial];
    
    // 添加底部评论
    [self textField];
    
    // 左边导航栏
    [self backLeftNav];
    
    // 加载进度条
    [self showLogo];
    
    // 添加logo图片
    [self.view addSubview:self.activityIndicatorView2];
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
    
    // 返回时，显示工具栏
    self.tabBarController.tabBar.hidden = NO;
}

// 调整logo的位置
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat offsetY = self.view.frame.size.height * 0.5 - 78;
    //   整个图片的位置
    self.activityIndicatorView2.frame = CGRectMake(self.view.frame.size.width *0.5 - 50, offsetY, 100.0f, 100.0f);
    self.activityIndicatorView2.layer.masksToBounds = YES;
    self.activityIndicatorView2.layer.cornerRadius = 20;
}

- (void)showLogo
{
    [self.activityIndicatorView2 startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:2.0 animations:^{
            [self.activityIndicatorView2 removeFromSuperview];
        }];
    });
    
}

// 懒加载
- (TYMActivityIndicatorView *)activityIndicatorView2
{
    if (!_activityIndicatorView2) {
        //  最大的view的内容
        _activityIndicatorView2 = [[TYMActivityIndicatorView alloc] initWithActivityIndicatorStyle:TYMActivityIndicatorViewStyleLarge];
        _activityIndicatorView2.hidesWhenStopped = NO;
    }
    return _activityIndicatorView2;
}


//- (void)backBtn
//{
//    DSLog(@"back...");
//    [self.navigationController popViewControllerAnimated:YES];
//    self.tabBarController.tabBar.hidden = NO;
//
//}

/** 初始化界面 */
- (void)initial
{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(40, 74 , 250, 100);
    imageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:imageView];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(15, 180, 300, self.view.frame.size.height);
    textView.font = [UIFont systemFontOfSize:kFont];
    textView.text = @"\t北京零点后,三里屯笙歌未歇,威斯汀酒店总统套房灯火通明.美国第一夫人米歇尔曾在这里安睡,然而2015年4月13日,两个男人注定在此无眠.生于1976年的湖南人姚劲波和生于1974年的安徽人杨浩涌,决定给他们十年的恩怨做个了断.赶集投资人定的酒店,排场考究.5.2万一天的市价,320平米的超大空间,在酒店33层,刚好适合决战紫禁之巅.上谈判桌之前,两家还在酣战.烧着一天1500万的广告费,58同城则在分众霸屏.";
    textView.editable = NO;
    [self.view addSubview:textView];
}

 // 添加底部的评论框
- (void)textField
{
    DSTabTextCommentView *textViewComment = [DSTabTextCommentView commentView];
    textViewComment.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
    [self.view addSubview:textViewComment];
}
@end
