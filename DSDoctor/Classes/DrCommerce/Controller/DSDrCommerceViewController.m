//
//  DSDrCommerceViewController.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSDrCommerceViewController.h"

#import "DSSideViewController.h"
#import "AppDelegate.h"
#import "DSTabBarView.h"
#import "DSNewsHeaderView.h"
#import "DSDrHeaderView.h"

#import "WZSnakeHUD.h"
#import "DSDrFinderViewController.h"

#import "TYMActivityIndicatorView.h"

#define kScreenWidth self.view.frame.size.width

@interface DSDrCommerceViewController () <DSTabBarViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) UIView *headView;

@property (nonatomic, weak) UIView *midView;

@property (nonatomic, weak) UIView *footView;

@property (nonatomic, weak) UIButton *btn;

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UILabel *answerLabel;

// logo图片
@property (nonatomic, strong) TYMActivityIndicatorView *activityIndicatorView2;

@end

@implementation DSDrCommerceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [MBProgressHUD showMessage:@"正在加载..."];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];
//    });
    
//    [WZSnakeHUD show:@""];

   // 加载进度条
    [self showLogo];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        // Do your stuff...
        dispatch_async(dispatch_get_main_queue(), ^{
//            [WZSnakeHUD hide];
        });
    });
    
    // 初始化界面
    [self initial];
    
    // 创建按钮
    [self createBtn];
    
    [self createButton];
    
    self.title = @"电商医生";
    
    // 找医生
    UIButton *drView = [[UIButton alloc] init];
    drView.frame = CGRectMake(35, 120, 60, 60);
    [drView addTarget:self action:@selector(findDr) forControlEvents:UIControlEventTouchUpInside];
    [self.midView addSubview:drView];
    
    [self.scrollView addHeaderWithTarget:self action:@selector(headerRefresh)];
    
    [self.scrollView addFooterWithTarget:self action:@selector(footRefresh)];
    
   // 添加logo图片
    [self.view addSubview:self.activityIndicatorView2];

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

/** 上拉 */
- (void)headerRefresh
{
    [self.scrollView headerEndRefreshing];
}

/** 下拉 */
- (void)footRefresh
{
    [self.scrollView footerEndRefreshing];
}

/** 找医生 */
- (void)findDr
{    /**
     new
     
     :returns: <#return value description#>
     */
//    DSConsultDrController *conVc = [[DSConsultDrController alloc] init];
//    conVc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:conVc animated:YES];
    
    DSDrFinderViewController *findVc = [[DSDrFinderViewController alloc] init];
    findVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:findVc animated:YES];
    
    NSLog(@"%s", __func__);
}

/** 初始化 */
- (void)initial
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 568)];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(0, 548);
    scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView = scrollView;
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 130)];
    UIImageView *headimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 130)];
    [headimage setImage:[UIImage imageNamed:@"header_01"]];
//    [headView addSubview:headimage];
    DSDrHeaderView *headerView = [DSDrHeaderView headerView];
    [self.scrollView addSubview:headerView];
    self.headView = headView;
    
    UIView *midView = [[UIView alloc] initWithFrame:CGRectMake(0, 170, kScreenW, 200)];
    [self.scrollView addSubview:midView];
    self.midView = midView;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 350, kScreenW, 200)];
    [self.scrollView addSubview:footView];
    self.footView = footView;
    
    // 添加导航栏
    UIImage *image  = [UIImage imageWithOriginalName:@"actionIconSinger"];
    
    // 导航栏左边
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftButton)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    // 导航栏右边
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalName:@"community_comment_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButton)];
    self.navigationItem.rightBarButtonItem = rightBtn;

}

/** 左滑动 */
- (void)leftButton
{
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    DSSideViewController *sideViewController1=[delegate sideViewController];
    [sideViewController1 showLeftViewController:true];
}

/** 右滑动 */
- (void)rightButton
{
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    DSSideViewController *sideViewController=[delegate sideViewController];
    [sideViewController showRightViewController:true];
}

/****************	创建按钮   ****************/

- (void)createBtn
{
    // 免费提问
    [self createImage:self.imageView imageFrame:CGRectMake(40, 20, 60, 50) view:self.midView image:@"Comm_01"];
    [self createLabel:self.answerLabel Frame:CGRectMake(30, 70, 80, 30) view:self.midView text:@"免费提问"];
    
    // 今日案例
    [self createImage:self.imageView imageFrame:CGRectMake(210, 20, 60, 50) view:self.midView image:@"Comm_02"];
    [self createLabel:self.answerLabel Frame:CGRectMake(200, 70, 80, 30) view:self.midView text:@"今日案例"];
    
    // 添加分割线
    UIView *vertical = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width *0.5, 180, 1, 80)];
    vertical.backgroundColor = [UIColor blackColor];
    vertical.alpha = 0.1;
    [self.scrollView addSubview:vertical];
    
    UIView *clow = [[UIView alloc] initWithFrame:CGRectMake(10, 270, 300, 1)];
    clow.backgroundColor = [UIColor blackColor];
    clow.alpha = 0.1;
    [self.scrollView addSubview:clow];
    
    UIView *vertical02 = [[UIView alloc] initWithFrame:CGRectMake(115, 300, 1, 50)];
    vertical02.backgroundColor = [UIColor blackColor];
    vertical02.alpha = 0.1;
    [self.scrollView addSubview:vertical02];
    
    UIView *vertiacl03 = [[UIView alloc] initWithFrame:CGRectMake(225, 300, 1, 50)];
    vertiacl03.backgroundColor = [UIColor blackColor];
    vertiacl03.alpha = 0.1;
    [self.scrollView addSubview:vertiacl03];
    
    // 找导师
    [self createImage:self.imageView imageFrame:CGRectMake(50, 120, 30, 40) view:self.midView image:@"Comm_03"];
    [self createLabel:self.answerLabel Frame:CGRectMake(25, 160, 80, 30) view:self.midView text:@"找导师"];
    
    // 在线资讯
    [self createImage:self.imageView imageFrame:CGRectMake(150, 120, 40, 40) view:self.midView image:@"Comm_04"];
    [self createLabel:self.answerLabel Frame:CGRectMake(130, 160, 80, 30) view:self.midView text:@"在线资讯"];
    
    // 常见问题
    [self createImage:self.imageView imageFrame:CGRectMake(250, 120, 30, 40) view:self.midView image:@"Comm_05"];
    [self createLabel:self.answerLabel Frame:CGRectMake(230, 160, 80, 30) view:self.midView text:@"免费提问"];
}

- (void)createButton
{
    [self creataButton:self.btn btnFrame:CGRectMake(20, 20, 130, 70) view:self.footView image:@"Comm_06" title:@"运营导师汇"];
    [self creataButton:self.btn btnFrame:CGRectMake(170, 20, 130, 70) view:self.footView image:@"Comm_07" title:@"推广资讯室"];
    [self creataButton:self.btn btnFrame:CGRectMake(20, 110, 130, 70) view:self.footView image:@"Comm_08" title:@"视觉优化"];
    [self creataButton:self.btn btnFrame:CGRectMake(170, 110, 130, 70) view:self.footView image:@"Comm_08" title:@"文案策划"];
}

/**
 *  封装图片
 *
 *  @param imageView 传入的图片
 *  @param frame     图片的frame
 *  @param view      加载的view
 */
- (void)createImage:(UIImageView *)imageView imageFrame:(CGRect)frame view:(UIView *)view image:(NSString *)imageName
{
    imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.frame = frame;
    [view addSubview:imageView];
}

/**
 *  封装label
 *
 *  @param label 传入label
 *  @param frame labelframe
 *  @param view  加载view
 *  @param text  label文字
 */
- (void)createLabel:(UILabel *)label Frame:(CGRect)frame view:(UIView *)view text:(NSString *)text
{
    label = [[UILabel alloc] init];
    label.frame = frame;
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
}

/**
 *  封装按钮
 *
 *  @param btn       传入按钮
 *  @param frame     按钮的frame
 *  @param view      加载的view
 *  @param imageName 按钮图片的名称
 *  @param title     按钮的title
 */
- (void)creataButton:(UIButton *)btn btnFrame:(CGRect)frame view:(UIView *)view image:(NSString *)imageName title:(NSString *)title
{
    btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setFrame:frame];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 0);
    [view addSubview:btn];
}

@end
