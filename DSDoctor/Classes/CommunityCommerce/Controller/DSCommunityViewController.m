//
//  DSCommunityViewController.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSCommunityViewController.h"
#import "DSMicroBlog.h"
#import "DSMicroBlogCell.h"
#import "DSMicroBlogFrame.h"

#import "DSNextController.h"
#import "DSOneViewController.h"
#import "DStwoViewController.h"
#import "DSthreeViewController.h"
#import "DSFourViewController.h"

// 解决导航栏被覆盖的问题
#import "DSSideViewController.h"
#import "AppDelegate.h"
#import "DSTabBarView.h"

#import "TYMActivityIndicatorView.h"

@interface DSCommunityViewController () <UITableViewDataSource, UITableViewDelegate,DSTabBarViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *microBlogFrames;

// logo图片
@property (nonatomic, strong) TYMActivityIndicatorView *activityIndicatorView2;

@end

@implementation DSCommunityViewController

- (NSArray *)microBlogFrames
{
    if (!_microBlogFrames) {
        //加载模型数据
        NSArray *microBlogs = [DSMicroBlog microBlogsList];
        NSMutableArray *frames = [NSMutableArray array];
        for (DSMicroBlog *blog in microBlogs) {
            //创建frame模型对象
            DSMicroBlogFrame *frame = [[DSMicroBlogFrame alloc] init];
            frame.microBlog = blog;
            //
            [frames addObject:frame];
        }
        _microBlogFrames = frames;
    }
    return _microBlogFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [MBProgressHUD showMessage:@"正在加载..."];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];
//    });
    
    // 加载进度条
    [self showLogo];
    
    // 初始化布局
    [self initial];
    
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

/** 初始化 */
- (void)initial
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    // 后面的cell没事件就不显示
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"热门话题";
    label.font = [UIFont systemFontOfSize:DSNameFont];
    label.frame = CGRectMake(0, 0, 50, 20);
    self.tableView.tableHeaderView = label;
}

/****************	Table view dataSource   ****************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.microBlogFrames.count;
}

/** 创建每一行的cell数据 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1 创建可重用的自定义cell
    DSMicroBlogCell *cell = [DSMicroBlogCell microBlogCellWithTableView:tableView];
    //2 设置子控件的值
    DSMicroBlogFrame *frame = self.microBlogFrames[indexPath.row];
    cell.microBlogFrame = frame;
    
    return cell;
    
}

/****************	Table view delegate   ****************/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DSMicroBlogFrame *frame = self.microBlogFrames[indexPath.row];
    return frame.rowHeight;
}

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

@end
