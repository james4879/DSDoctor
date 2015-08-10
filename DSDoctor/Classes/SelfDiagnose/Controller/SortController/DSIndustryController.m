//
//  DSIndustryController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/5.
//  Copyright (c) 2015年 James. All rights reserved.
//
// 行业案例

#import "DSIndustryController.h"

#import "DSSelfTableViewCell.h"
#import "DSSelfDiagnModel.h"

// 添加－女装、男装、母婴、家电
#import "DSfemaleController.h"
#import "DSmaleController.h"
#import "DSInfantmomController.h"
#import "DSApplianceController.h"

// 添加加载logo
#import "TYMActivityIndicatorView.h"

@interface DSIndustryController ()

// 数据加载,行业案例
@property (nonatomic, strong) NSMutableArray *myselSecondfModel;

@property (nonatomic, weak) UITableView *tableView;



// logo图片
@property (nonatomic, strong) TYMActivityIndicatorView *activityIndicatorView2;
@end

@implementation DSIndustryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载进度条
    [self showLogo];
    
//    [MBProgressHUD showMessage:@"正在加载..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
    });
    
    // 只显示数据，不显示空的cell
    self.tableView.tableFooterView = [UIView new];
    
    // 隐藏标签栏
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
////    [leftButton setFrame:CGRectMake(0, 0, 40, 40)];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
////    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    
//    [leftButton addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventAllEvents];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//    self.tabBarController.tabBar.hidden = YES;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 44, 44)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.tabBarController.tabBar.hidden = YES;
    
    // 下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefresh)];
    
    // 上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(footRefresh)];

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

- (void)showLogo
{
    [self.activityIndicatorView2 startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
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

- (void)backBtn
{
    DSLog(@"back...");
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
}

/**
 *  懒加载
 */
- (NSMutableArray *)myselSecondfModel
{
    if (_myselSecondfModel == nil) {
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"myselfSecond.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:patch];
        
        NSMutableArray *dictArray = [NSMutableArray array];
        for (NSDictionary *dicr in array) {
            DSSelfDiagnModel *mfself = [DSSelfDiagnModel selfWithDiagn:dicr];
            [dictArray addObject:mfself];
            
        }
        _myselSecondfModel = dictArray;
    }
    return _myselSecondfModel;
}

-(void)setTitleStr:(NSString *)titleStr{
    
    [self.tableView reloadData];
}

#pragma mark - 数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.myselSecondfModel.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建自定义cell
    DSSelfTableViewCell *cell=[DSSelfTableViewCell cellWithTableView:tableView];
    
    // 给cell传递模型数值
    cell.selfModel = self.myselSecondfModel[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

// 选中的行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中的行
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sec = indexPath.row;
    
    // 判断选中2级目录的行
    if (sec == 0) {
        DSLog(@"选中了。。");
        // 女装
        DSfemaleController *femailController = [[DSfemaleController alloc] init];
        [self.navigationController pushViewController:femailController animated:YES];
        
    } else if (sec == 1){
        // 男装
        DSmaleController *mailController = [[DSmaleController alloc] init];
        [self.navigationController pushViewController:mailController animated:YES];
    } else if (sec == 2){
        // 母婴
        DSInfantmomController *infantController = [[DSInfantmomController alloc] init];
        [self.navigationController pushViewController:infantController animated:YES];
    } else if (sec == 3) {
        //  家电
        DSApplianceController *applianceController = [[DSApplianceController alloc] init];
        [self.navigationController pushViewController:applianceController animated:YES];
    }
        
}

@end
