//
//  DSMockController.m
//  DSDoctor
//
//  Created by James on 4/29/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSMockController.h"
#import "CorePagesView.h"
#import "OrderListTVC.h" // 第一个视图控制器(热点)

// 5个导航（热点、专题、活动、电商、干货）
#import "DSSpecialViewController.h"
#import "DSNewsTableViewCell.h"
#import "DSActivityController.h"
#import "DSBusinessController.h"
#import "DSDryController.h"

// 解决导航栏被覆盖的问题
#import "DSSideViewController.h"
#import "AppDelegate.h"
#import "DSTabBarView.h"

#import "TYMActivityIndicatorView.h"

@interface DSMockController () <DSTabBarViewDelegate>

@property (nonatomic, strong) CorePagesView *pagesView;

// logo图片
@property (nonatomic, strong) TYMActivityIndicatorView *activityIndicatorView2;

@end

@implementation DSMockController

-(void)loadView{
    self.view=self.pagesView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

//    加载logo进度条
    [self showLogo];
    
//    [MBProgressHUD showMessage:@"正在加载..."];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];
//    });
    
    self.edgesForExtendedLayout=UIRectEdgeNone;
    // 添加导航栏
    UIImage *image  = [UIImage imageWithOriginalName:@"actionIconSinger"];
    
    // 导航栏左边
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftButton)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    // 导航栏右边
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalName:@"community_comment_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButton)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // 添加logo图片
    [self.view addSubview:self.activityIndicatorView2];
    
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


-(CorePagesView *)pagesView{
    
    if(_pagesView==nil){
    
#warning mark -- 替换不同的控制器（新建5个控制器 文件）
        
        OrderListTVC *list0TVC=[[OrderListTVC alloc] initWithStyle:UITableViewStylePlain];
//        list0TVC.index=0;
//        list0TVC.titleStr=@"热点";
        
        DSSpecialViewController *list1TVC=[[DSSpecialViewController alloc] initWithStyle:UITableViewStylePlain];
//        list1TVC.index=1;
//        list1TVC.titleStr=@"专题";
        
        DSActivityController *list2TVC=[[DSActivityController alloc] initWithStyle:UITableViewStylePlain];
//        list2TVC.index=2;
//        list2TVC.titleStr=@"活动";
        
        DSBusinessController *list3TVC=[[DSBusinessController alloc] initWithStyle:UITableViewStylePlain];
//        list3TVC.index=3;
//        list3TVC.titleStr=@"商道";
        
        DSDryController *list4TVC=[[DSDryController alloc] initWithStyle:UITableViewStylePlain];
//        list4TVC.index=4;
//        list4TVC.titleStr=@"干货";
        
        // 封装方法
        CorePageModel *model0=[CorePageModel model:list0TVC pageBarName:@"热点"];
        CorePageModel *model1=[CorePageModel model:list1TVC pageBarName:@"专题"];
        CorePageModel *model2=[CorePageModel model:list2TVC pageBarName:@"活动"];
        CorePageModel *model3=[CorePageModel model:list3TVC pageBarName:@"商道"];
        CorePageModel *model4=[CorePageModel model:list4TVC pageBarName:@"干货"];
        
        
        NSArray *pageModels=@[model0,model1,model2,model3,model4];
        
        _pagesView=[CorePagesView viewWithOwnerVC:self pageModels:pageModels];
    }
    
    return _pagesView;
}

@end
