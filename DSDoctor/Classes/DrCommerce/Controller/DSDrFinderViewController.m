//
//  DSDrFinderViewController.m
//  DSDoctor
//
//  Created by James on 5/12/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSDrFinderViewController.h"
#import "DOPDropDownMenu.h"
#import "DSDoctorViewModel.h"
#import "DSDoctorViewCell.h"

@interface DSDrFinderViewController () <DOPDropDownMenuDataSource, DOPDropDownMenuDelegate, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;
@property (nonatomic, strong) NSArray *sorts;

@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchController;

// 加载页面的数据
@property (nonatomic, strong) NSMutableArray *doctors;

@end

@implementation DSDrFinderViewController

- (NSMutableArray *)doctors
{
    if (!_doctors) {
        NSString *patch = [[NSBundle mainBundle] pathForResource:@"doctor.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:patch];
        
        NSMutableArray *dictArray = [NSMutableArray array];
        for (NSDictionary *dicr in array) {
            DSDoctorViewModel *mfself = [DSDoctorViewModel doctorWithDcit:dicr];
            [dictArray addObject:mfself];
            
        }
        _doctors = dictArray;
    }
    return _doctors;
}

- (void)loadView
{
    self.view = [UIView new];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)
                                                  style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // place search bar coordinates where the navbar is position - offset by statusbar
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, 320, 44)];
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"找导师咨询";
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalName:@"tabbar_discover"] style:UIBarButtonItemStylePlain target:self action:@selector(toggleSearch)];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    // only here to simulate nav stack
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
//    self.navigationItem.leftBarButtonItem = backButton;

    /**
     *  导航栏左边按钮
     */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnLeftNav) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.searchController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.searchController.searchResultsDataSource = self;
    self.searchController.searchResultsDelegate = self;
    self.searchController.delegate = self;
    
    // 数据
    self.classifys = @[@"导师专长",@"战略,规则,运营",@"战略,推广",@"视觉,管理",@"运营"];
    self.areas = @[@"选择科室",@"管理科",@"战略科",@"运营科",@"推广科",@"视觉科",@"规则科",@"其他"];
    self.sorts = @[@"智能排序",@"阿里认证",@"民间高高手",@"平台推荐"];
    
    self.cates = @[@"经济学",@"统计学",@"运筹学",@"生产与运营管理",@"市场营销"];
    self.movices = @[@"政治",@"军事",@"经济"];
    self.hostels = @[@"局部性",@"针对性",@"单一性",@"具体性",@"可行性"];
    
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
    
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    // 下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefresh)];
    
    // 上拉刷新
    [self.tableView addFooterWithTarget:self action:@selector(footRefresh)];
}

/** 左边导航栏按钮 */
- (void)btnLeftNav
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

/** 返回 */
- (void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Search controller

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    // force tableview to top
    int heightOfSearchBar = 44;
    int yOffset = -([self.topLayoutGuide length] + heightOfSearchBar); // toplayout guide + ios 7 assumes searchbar displayed
    self.tableView.contentOffset = CGPointMake(0, yOffset);
}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller
{
    // reposition the table where we want after search has completed
    // need to reschedule on runloop to rejig the table layout and correct the
    // offset and insets given no search bar will be displayed at the top of the controller
    // as we remove it
    dispatch_async(dispatch_get_main_queue(), ^{
        self.tableView.contentInset = UIEdgeInsetsMake([self.topLayoutGuide length], 0, 0, 0);
        self.tableView.contentOffset = CGPointMake(0, -[self.topLayoutGuide length]);
    });
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    [self.searchBar removeFromSuperview];
}

- (void)toggleSearch
{
    [self.view addSubview:self.searchBar];
    [self.searchController setActive:YES animated:YES];
    [self.searchBar becomeFirstResponder];
}

#pragma mark - Tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.doctors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    DSDoctorViewCell *cell = [DSDoctorViewCell cellDoctorWithTableView:tableView];
    
    // 2.给cell传递模型数据
    cell.doctorModel = self.doctors[indexPath.row];
    
    return cell;
}

#pragma mark - Tableview delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 下拉菜单

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.classifys.count;
    }else if (column == 1){
        return self.areas.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.classifys[indexPath.row];
    } else if (indexPath.column == 1){
        return self.areas[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    if (column == 0) {
        if (row == 0) {
            //            return self.cates.count;
        } else if (row == 1){
            //            return self.movices.count;
        } else if (row == 2){
            //            return self.hostels.count;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            //            return self.cates[indexPath.item];
        } else if (indexPath.row == 1){
            //            return self.movices[indexPath.item];
        } else if (indexPath.row == 2){
            //            return self.hostels[indexPath.item];
        }
    }
    return nil;
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}

@end
