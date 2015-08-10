//
//  DSSelfDiagnoseViewController.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSSelfDiagnoseViewController.h"
#import "DSSelfDiagnModel.h"
#import "DSSelfTableViewCell.h"

#import "DSSideViewController.h"
#import "AppDelegate.h"
#import "DSTabBarView.h"

#import "DSCaseController.h"

#import "TYMActivityIndicatorView.h"

@interface DSSelfDiagnoseViewController () <UITableViewDataSource, UITableViewDelegate,DSTabBarViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UISearchBar *searchBar;

@property (nonatomic, strong) NSMutableArray *mySelfcell;

// logo图片
@property (nonatomic, strong) TYMActivityIndicatorView *activityIndicatorView2;

@end

@implementation DSSelfDiagnoseViewController

/**
 *  懒加载
 */
- (NSMutableArray *)mySelfcell
{
    if (_mySelfcell == nil) {
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"mySelf.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:patch];
        
        NSMutableArray *dictArray = [NSMutableArray array];
        for (NSDictionary *dicr in array) {
            DSSelfDiagnModel *mfself = [DSSelfDiagnModel selfWithDiagn:dicr];
            [dictArray addObject:mfself];
            
        }
        _mySelfcell = dictArray;
    }
    return _mySelfcell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [MBProgressHUD showMessage:@"正在加载..."];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];
//    });
    
    UITableView *table = [[UITableView alloc] init];
    table.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView = table;
    
    // 实现数据源方法
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:table];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(nextVc)];
    //self.navigationItem.title = @"自我诊断";
    
    self.tableView.tableFooterView = [UIView new];

    // 指定义搜索栏
     [self customSearchBar];

    // 添加导航栏
    UIImage *image  = [UIImage imageWithOriginalName:@"actionIconSinger"];
    
    // 导航栏左边
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftButton)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    // 导航栏右边
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalName:@"community_comment_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButton)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    // 下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefresh)];
    
    // 上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(footRefresh)];
    
    // 加载进度条
    [self showLogo];
    // 添加logo图片
    [self.view addSubview:self.activityIndicatorView2];

}

/** 上拉刷新 */
- (void)footRefresh
{
    [self.tableView footerEndRefreshing];
}

// 下拉刷新
- (void)headerRefresh
{
    DSLog(@"更新下拉刷新内容区。。");
    [self.tableView headerEndRefreshing];
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
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

    
- (void)customSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    searchBar.placeholder = @"搜索";
    searchBar.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = searchBar;
    self.searchBar = searchBar;
}

//- (void)nextVc
//{
//    NSLog(@"..搜索");
//}

/** 初始化 */
- (void)initial
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tableView.dataSource = self;
    [self.view addSubview:tableView];
     self.tableView = tableView;
}

/****************	Table View dataSource   ****************/
#pragma mark -- 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mySelfcell.count;
}

/**
 *  每一行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    DSSelfTableViewCell *cell = [DSSelfTableViewCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    cell.selfModel = self.mySelfcell[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

/** 开始拖动, 退出键盘 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger flag = indexPath.row;
    switch (flag) {
        case 0:
        {
            NSLog(@"1-->%s", __func__);
            // 自我诊断
            // DSCaseController *caseController = [[DSCaseController alloc] init];
//           
//            [self.navigationController pushViewController:caseController animated:YES];
            break;
        }
        case 1:
        {
            NSLog(@"2-->%s", __func__);
            // 案例库
            DSCaseController *caseController1 = [[DSCaseController alloc] init];
            caseController1.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:caseController1 animated:YES];
            
            break;
        }
        case 2:
        {
            NSLog(@"3-->%s", __func__);
            // 附近 
//             DSCaseController *caseController2 = [[DSCaseController alloc] init];
//            caseController2.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:caseController2 animated:YES];
//            break;
        }
    }
}

@end
