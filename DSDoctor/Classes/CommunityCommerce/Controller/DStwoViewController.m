//
//  DStwoViewController.m
//  DSDoctor
//
//  Created by Chenghui on 15/4/28.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DStwoViewController.h"

#import "TYMActivityIndicatorView.h"

@interface DStwoViewController ()

// logo图片
@property (nonatomic, strong) TYMActivityIndicatorView *activityIndicatorView2;

@end

@implementation DStwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [MBProgressHUD showMessage:@"正在加载..."];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];
//    });
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
    
    self.title = @"最热";
    
    // 隐藏标签栏
    self.tabBarController.tabBar.hidden = YES;
    
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
    
    // 显示标签栏
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
////    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
