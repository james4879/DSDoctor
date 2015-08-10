//
//  DSView.m
//  DSDoctor
//
//  Created by James on 4/28/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSView.h"
#import "DSNewsTableViewCell.h"
#import "DSNewsComModel.h"
#import "DSNewsController.h"
#import "DSNewsHeaderView.h"

@interface DSView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *itemsArray;

@end

@implementation DSView

- (NSMutableArray *)itemsArray
{
    if (_itemsArray == nil) {
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"news.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:patch];
        NSMutableArray *arrayDict = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            DSNewsComModel *newsModel = [DSNewsComModel dsNewsWithDcit:dict];
            [arrayDict addObject:newsModel];
        }
        _itemsArray = arrayDict;
    }
    return _itemsArray;
}


-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        // 初始化tableView
        [self createTableView];
    }
    return self;
}

- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, -5, 320, 1024);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableHeaderView = [DSNewsHeaderView headerView];
    [self addSubview:tableView];
    self.tableView = tableView;
}

/****************	Table View dataSource   ****************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsArray.count;
}

/** 创建每一行的cell数据 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DSNewsTableViewCell *cell = [DSNewsTableViewCell cellWithTableView:tableView];
    cell.newsModel = self.itemsArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

/****************	Table view delegate   ****************/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger sec = indexPath.row;
    switch (sec) {
        case 0:
        {
            NSLog(@"第一行");

        }
            break;
            
        case 1:
        {
            NSLog(@"第二行");
            
        }
            break;
            
        case 2:
        {
            NSLog(@"第三行");
            
        }
            break;
    }
}

@end
