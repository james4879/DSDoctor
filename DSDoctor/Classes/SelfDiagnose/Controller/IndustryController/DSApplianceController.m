//
//  DSApplianceController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/5.
//  Copyright (c) 2015年 James. All rights reserved.
//
// 家电
#import "DSApplianceController.h"

#import "DSNewsModel.h"
#import "DSNewsCell.h"

// 导入 电器的3个文件
#import "DSApplianceNewViewController.h"
#import "DSKoreanApplianceViewController.h"
#import "DSCollectionApplianceViewController.h"

@interface DSApplianceController ()

// 数据加载
@property (nonatomic, strong) NSMutableArray *myselSecondfModel;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UISearchBar *searchBar;
@end

@implementation DSApplianceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 搜索
    [self customSearchBar];
    
    self.title = @"家电";
    
    self.tableView.tableFooterView = [UIView new];
    
    /**
     *  返回
     */
    [self backBtn];
}

- (void)backBtn
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(baclLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

- (void)baclLeftBtn
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
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"applicance.plist" ofType:nil];
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
        //  最新电器
        DSApplianceNewViewController *newApplian = [[DSApplianceNewViewController alloc] init];
        [self.navigationController pushViewController:newApplian animated:YES];
        
    } else  if (sec == 1){
        //   韩式电器
        DSKoreanApplianceViewController *koreanAppliance = [[DSKoreanApplianceViewController alloc] init];
        [self.navigationController pushViewController:koreanAppliance animated:YES];
        
    } else if (sec == 2) {
        //  精品电器
        DSCollectionApplianceViewController *collectionApplian = [[DSCollectionApplianceViewController alloc] init];
        [self.navigationController pushViewController:collectionApplian animated:YES];
    }
}
@end
