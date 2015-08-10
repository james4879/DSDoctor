//
//  DSProfileController.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSProfileController.h"

#import "LogionTableViewCell.h"
#import "UItableViewCellModel.h"
#import "HeaderView.h"

#define kScreenWidth self.view.frame.size.width

@interface DSProfileController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tabelView;
// 登录的数据
@property (nonatomic, strong) NSMutableArray *logions;

@end

@implementation DSProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化-- 设置大小才能使用
    UITableView *table = [[UITableView alloc] init];
    table.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tabelView = table;
    
    // 添加头部视图
    self.tabelView.tableHeaderView = [HeaderView headerView];
    // 实现数据源方法
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    [self.view addSubview:table];
    
    self.navigationItem.title = @"个人中心";
}

- (void)nextVc
{
    NSLog(@"right");
}

// 懒加载
- (NSMutableArray *)logions
{
    if (_logions == nil) {
        
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"logion.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:patch];
        NSMutableArray *arrayMutable= [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            UItableViewCellModel *model = [UItableViewCellModel cellInitWithDict:dict];
            
            [arrayMutable addObject:model];
        }
        _logions = arrayMutable;
    }
    
    return _logions;
}

#pragma mark -- 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.logions.count;
}

/**
 *  每一行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    LogionTableViewCell *cell = [LogionTableViewCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    cell.logionModel = self.logions[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

// 选中的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DSLog(@"%@选中的行",indexPath);
    
    [self.tabelView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sec = indexPath.row;
    if (sec == 0) {
        DSLog(@"选中第一行。。");
    } else if (sec == 1){
    
    }
}

@end
