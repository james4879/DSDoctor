//
//  DSSpecialViewController.m
//  DSDoctor
//
//  Created by Chenghui on 15/4/29.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSSpecialViewController.h"
#import "DSNewsTableViewCell.h"

#import "DSSpecialModel.h"

#import "DSNextController.h"
#import "DSOneViewController.h"
#import "DStwoViewController.h"
#import "DSthreeViewController.h"
#import "DSFourViewController.h"

// 添加广告
#import "DSNewsHeaderView.h"

@interface DSSpecialViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *special;
@end

@implementation DSSpecialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加广告
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

- (NSMutableArray *)special
{
    if (_special == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"special.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *tgArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建模型对象
            DSSpecialModel *tg = [DSSpecialModel dsNewsWithDcit:dict];
            
            // 3.2.添加模型对象到数组中
            [tgArray addObject:tg];
        }
        
        // 4.赋值
        _special = tgArray;
    }
    return _special;

}

#pragma mark - 数据源方法
/**
 *  一共有多少行数据
 */
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.special.count;
//}
//
///**
// *  每一行显示怎样的cell--(把它暴露出去，在View里)
// */
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // 1.创建cell
//    DSNewsTableViewCell *cell = [DSNewsTableViewCell cellWithTableView:tableView];
//    
//    // 2.给cell传递模型数据
//    cell.newsModel = self.special[indexPath.row];
//    return cell;
//}

//-(void)setTitleStr:(NSString *)titleStr{
//    _titleStr=titleStr;
//    [self.tableView reloadData];
//}

#pragma mark -- 数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.special.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rid=@"rid";
    
    DSNewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    //    if(cell==nil){
    //        cell=[[DSNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    //    }
    
    //    cell.textLabel.text=[NSString stringWithFormat:@"%@:%@的第%@行",@(self.index),self.titleStr,@(indexPath.row)];
    
    if (cell == nil) {
        // 从xib 加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DSNewsTableViewCell" owner:nil options:nil] lastObject];
    }
    
    cell.newsModel = self.special[indexPath.row];
    
    return cell;
}

-(void)dealloc{
    DSLog(@"被释放");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    DSNewsController *news = [[DSNewsController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:news];
//    [self presentViewController:nav animated:YES completion:nil];

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sec = indexPath.row;
    if (sec == 0) {
        
        DSOneViewController *one = [[DSOneViewController alloc] initWithNibName:@"DSOneViewController" bundle:nil];
//        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:one];
//        [self.navigationController presentViewController:nav1 animated:YES completion:nil];
        [self.navigationController pushViewController:one animated:YES];
    } else if (sec == 1) {
        DSLog(@"second");
        DSNextController *vc = [[DSNextController alloc] init];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//        [self.navigationController presentViewController:nav animated:YES completion:nil];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if(sec == 2){
        DSLog(@"3");
        DStwoViewController *two = [[DStwoViewController alloc] initWithNibName:@"DStwoViewController" bundle:nil];
//        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:two];
//        [self.navigationController presentViewController:nav1 animated:YES completion:nil];
        [self.navigationController pushViewController:two animated:YES];
        
    } else if (sec == 3) {
        DSLog(@"4");
        DSthreeViewController *three = [[DSthreeViewController alloc] initWithNibName:@"DSthreeViewController" bundle:nil];
//        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:three];
//        [self.navigationController presentViewController:nav1 animated:YES completion:nil];
        [self.navigationController pushViewController:three animated:YES];
        
    } else if (sec == 4) {
        DSLog(@"5");
        DSFourViewController *four = [[DSFourViewController alloc] initWithNibName:@"DSFourViewController" bundle:nil];
//        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:four];
//        [self.navigationController presentViewController:nav1 animated:YES completion:nil];
        [self.navigationController pushViewController:four animated:YES];
    } else if (sec == 5)
    {
        DSLog(@"6");
        DSthreeViewController *three = [[DSthreeViewController alloc] initWithNibName:@"DSthreeViewController" bundle:nil];
//        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:three];
//        [self.navigationController presentViewController:nav1 animated:YES completion:nil];
        [self.navigationController pushViewController:three animated:YES];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

@end
