//
//  DSGeneraViewController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/7.
//  Copyright (c) 2015年 James. All rights reserved.
//
//  运营
#import "DSGeneraViewController.h"

#import "DSNewsModel.h"
#import "DSNewsCell.h"

#import "DSNextController.h"
#import "DSOneViewController.h"
#import "DStwoViewController.h"

@interface DSGeneraViewController ()

@property (nonatomic, strong)NSMutableArray *myselSecondfModel;

@property (nonatomic, weak)UISearchBar *searBar;

@property (nonatomic, weak)UITableView *tableView;

@end

@implementation DSGeneraViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 搜索框
    [self customSearchBar];
    self.title = @"运营";
    self.tableView.tableFooterView = [UIView new];
    
    /**
     *  左边返回按钮
     */
    [self leftBackNav];
}

/**
 *  左边导航栏返回
 */
- (void)leftBackNav
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backItem) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)backItem
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)customSearchBar
{
    UISearchBar *searBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    searBar.backgroundColor = [UIColor clearColor];
    searBar.placeholder = @"搜索";
    self.tableView.tableHeaderView = searBar;
    self.searBar = searBar;
}

/**
 *  懒加载
 */
- (NSMutableArray *)myselSecondfModel
{
    if (_myselSecondfModel == nil) {
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"operation.plist" ofType:nil];
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

#pragma mark -- 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myselSecondfModel.count;
}

/**
 *  每一行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    DSNewsCell *cell = [DSNewsCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    cell.newsModel = self.myselSecondfModel[indexPath.row];
    
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

// 选中的行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中的行
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sec = indexPath.row;
    
    // 判断选中2级目录的行
    if (sec == 0) {
        DSLog(@"选中了。。");
        // 第1个 运营
        DSNextController *femailController = [[DSNextController alloc] init];
        [self.navigationController pushViewController:femailController animated:YES];
        
    } else if (sec == 1){
        // 第2个 运营
        DSOneViewController *mailController = [[DSOneViewController alloc] init];
        [self.navigationController pushViewController:mailController animated:YES];
    } else if (sec == 2){
        // 第3个 运营
        DStwoViewController *infantController = [[DStwoViewController alloc] init];
        [self.navigationController pushViewController:infantController animated:YES];
    }
}
@end
