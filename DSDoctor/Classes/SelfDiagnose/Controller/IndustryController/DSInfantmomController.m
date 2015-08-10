//
//  DSInfantmomController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/5.
//  Copyright (c) 2015年 James. All rights reserved.
//
// 母婴
#import "DSInfantmomController.h"

#import "DSNewsModel.h"
#import "DSNewsCell.h"

// 导入最新母婴产品、韩式母婴、精品母婴
#import "DSInfantMomViewController.h"
#import "DSKoreanInfantmomController.h"
#import "DSConnectionMomController.h"

@interface DSInfantmomController ()

// 数据加载
@property (nonatomic, strong) NSMutableArray *myselSecondfModel;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UISearchBar *searchBar;
@end

@implementation DSInfantmomController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 搜索
    [self customSearchBar];
    
    self.title = @"母婴";
    
    self.tableView.tableFooterView = [UIView new];
    
    /**
     *  返回按钮
     */
    [self backBtn];
}

- (void)backBtn
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

- (void)leftButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)customSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    searchBar.placeholder = @"搜索";
    searchBar.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = searchBar;
    self.searchBar = searchBar;
}

/**
 *  懒加载
 */
- (NSMutableArray *)myselSecondfModel
{
    if (_myselSecondfModel == nil) {
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"Korean.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:patch];
        
        NSMutableArray *dictArray = [NSMutableArray array];
        for (NSDictionary *dicr in array) {
            DSNewsModel *mfself = [DSNewsModel newsWithDiagn:dicr];
            [dictArray addObject:mfself];
            
        }
        _myselSecondfModel = dictArray;
    }
    return _myselSecondfModel;
}


#pragma mark - 数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.myselSecondfModel.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建自定义cell
    DSNewsCell *cell=[DSNewsCell cellWithTableView:tableView];
    
    // 给cell传递模型数值
    cell.newsModel = self.myselSecondfModel[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sec = indexPath.row;
    
    if (sec == 0) {
    //新母婴产品
        DSInfantMomViewController *infantMom = [[DSInfantMomViewController alloc] init];
        [self.navigationController pushViewController:infantMom animated:YES];
        
    } else if (sec == 1) {
    //韩式母婴
        DSKoreanInfantmomController *koreanMom = [[DSKoreanInfantmomController alloc] init];
        [self.navigationController pushViewController:koreanMom animated:YES];
        
    } else if(sec == 2) {
    //精品母婴
        DSConnectionMomController *conMom = [[DSConnectionMomController alloc] init];
        [self.navigationController pushViewController:conMom animated:YES];
    }
}

@end
