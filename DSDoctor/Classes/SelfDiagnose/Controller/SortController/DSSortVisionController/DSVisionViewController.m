//
//  DSVisionViewController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/7.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  视觉
#import "DSVisionViewController.h"

#import "DSNewsModel.h"
#import "DSNewsCell.h"

#import "DSOneViewController.h"
#import "DStwoViewController.h"
#import "DSFourViewController.h"

@interface DSVisionViewController ()

// 数据加载
@property (nonatomic, strong) NSMutableArray *myselSecondfModel;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UISearchBar *searchBar;

@end

@implementation DSVisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 搜索
    [self customSearchBar];
    
    self.title = @"视觉";
    
    self.tableView.tableFooterView = [UIView new];
    
    /**
     *  左边导航栏
     */
    [self leftBackNav];
}

- (void)leftBackNav
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backItem) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)backItem
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
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"vision.plist" ofType:nil];
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

// 选中的行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中的行
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sec = indexPath.row;
    
    // 判断选中2级目录的行
    if (sec == 0) {
        DSLog(@"选中了。。");
        // 第1个 视觉
        DStwoViewController *femailController = [[DStwoViewController alloc] init];
        femailController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:femailController animated:YES];
        
    } else if (sec == 1){
        // 第2个 视觉
        DSFourViewController *mailController = [[DSFourViewController alloc] init];
        mailController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mailController animated:YES];
    } else if (sec == 2){
        // 第3个 视觉
        DSOneViewController *infantController = [[DSOneViewController alloc] init];
        infantController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:infantController animated:YES];
    }
}

@end
