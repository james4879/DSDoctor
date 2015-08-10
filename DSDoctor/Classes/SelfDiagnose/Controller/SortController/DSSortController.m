//
//  DSSortController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/5.
//  Copyright (c) 2015年 James. All rights reserved.
//
// 案例分类

#import "DSSortController.h"

#import "DSSelfTableViewCell.h"
#import "DSSelfDiagnModel.h"

// 添加运营、推广、策划、视觉
#import "DSGeneraViewController.h"
#import "DSPlanViewController.h"
#import "DSOperationViewController.h"
#import "DSVisionViewController.h"

@interface DSSortController ()

// 数据加载,行业案例
@property (nonatomic, strong) NSMutableArray *myselSecondfModel;

@property (nonatomic, weak) UITableView *tableView;
// 用来记录标题的属性
@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation DSSortController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    // 下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefresh)];
    
    // 上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(footRefresh)];
    
    /**
     *  左边的返回按钮
     */
    [self lefNavBack];
}

- (void)lefNavBack
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftbackNav) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)leftbackNav
{
    [self.navigationController popViewControllerAnimated:YES];
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

/**
 *  懒加载
 */
- (NSMutableArray *)myselSecondfModel
{
    if (_myselSecondfModel == nil) {
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"sort.plist" ofType:nil];
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
        // 运营
        DSGeneraViewController *generaVC = [[DSGeneraViewController alloc] init];
        generaVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:generaVC animated:YES];
        
    } else if (sec == 1){
        // 推广
        DSLog(@"选中了。2。");
        DSPlanViewController *planVC = [[DSPlanViewController alloc] init];
        planVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:planVC animated:YES];
        
    } else if (sec == 2){
        // 策划
        DSLog(@"选中了。3。");
        DSOperationViewController *operVC = [[DSOperationViewController alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:operVC animated:YES];
        
    } else if (sec == 3){
        // 视觉
        DSLog(@"选中了。4。");
        DSVisionViewController *visionVC = [[DSVisionViewController alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:visionVC animated:YES];
    }
}


@end
