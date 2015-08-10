//
//  OrderListTVC.m
//  CorePagesView
//
//  Created by muxi on 15/3/20.
//  Copyright (c) 2015年 muxi. All rights reserved.
//
//  第一个控制器
#import "OrderListTVC.h"

#import "DSNewsTableViewCell.h"
#import "CorePageModel.h"

#import "DSNextController.h"
#import "DSOneViewController.h"
#import "DStwoViewController.h"
#import "DSthreeViewController.h"
#import "DSFourViewController.h"
// 广告
#import "DSNewsHeaderView.h"

@interface OrderListTVC ()

// 数据加载
@property (nonatomic, strong) NSMutableArray *hotModel;

@end

@implementation OrderListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.borderColor=[UIColor brownColor].CGColor;
    self.view.layer.borderWidth=1.0f;
    
    // [self.tableView setHeight:68];
    
    // 添加头部文件
    self.tableView.tableHeaderView = [DSNewsHeaderView headerView];
    
    // 下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];

}

- (void)headerRereshing
{
    DSLog(@"下拉刷新！");
    
    // 让下拉刷新头部控件停止刷新状态
    [self.tableView headerEndRefreshing];
}

- (void)footerRereshing
{
    DSLog(@"上拉刷新！");
 // 让上拉刷新尾部控件停止刷新状态
    [self.tableView footerEndRefreshing];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%ld:viewDidAppear显示",_index);
}


-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    NSLog(@"%ld:viewDidDisappear消失",_index);
}

- (NSMutableArray *)hotModel
{
    if (self == [super init]) {
        
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"hot.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:patch];
        
        NSMutableArray *arrayDict = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            CorePageModel *cell = [CorePageModel dsNewsWithDcit:dict];
            [arrayDict addObject:cell];
        }
        _hotModel = arrayDict;
    }
    return _hotModel;
}

-(void)setTitleStr:(NSString *)titleStr{
    _titleStr=titleStr;
    [self.tableView reloadData];
}

#pragma mark -- 数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.hotModel.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rid=@"rid";
    
    DSNewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    if (cell == nil) {
        // 从xib 加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DSNewsTableViewCell" owner:nil options:nil] lastObject];
    }
    cell.newsModel = self.hotModel[indexPath.row];
    return cell;
}

-(void)dealloc{
    NSLog(@"被释放");
}

// 选中的cell 的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sec = indexPath.row;
    if (sec == 0) {
        DSNextController *vc = [[DSNextController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (sec == 1) {
        NSLog(@"second");
        DSOneViewController *one = [[DSOneViewController alloc] initWithNibName:@"DSOneViewController" bundle:nil];
        [self.navigationController pushViewController:one animated:YES];
        
    } else if(sec == 2){
        NSLog(@"3");
        DStwoViewController *two = [[DStwoViewController alloc] initWithNibName:@"DStwoViewController" bundle:nil];
        [self.navigationController pushViewController:two animated:YES];
        
    } else if (sec == 3) {
        NSLog(@"4");
        DSthreeViewController *three = [[DSthreeViewController alloc] initWithNibName:@"DSthreeViewController" bundle:nil];
        [self.navigationController pushViewController:three animated:YES];
        
        
    } else if (sec == 4) {
        NSLog(@"5");
        DSFourViewController *four = [[DSFourViewController alloc] initWithNibName:@"DSFourViewController" bundle:nil];
        [self.navigationController pushViewController:four animated:YES];
        
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

@end
