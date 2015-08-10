//
//  DSMainController.m
//  Dr-Commerce
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSMainController.h"
#import "DSSideViewController.h"
#import "AppDelegate.h"
#import "DSTabBarView.h"

#import "DSDrCommerceViewController.h"
#import "DSSelfDiagnoseViewController.h"
#import "DSCommunityViewController.h"

#import "DSMockController.h"
#import "DSNavigationController.h"


@interface DSMainController () <DSTabBarViewDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation DSMainController

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    DSSideViewController *sideViewController=[delegate sideViewController];
    [sideViewController setRootViewMoveBlock:^(UIView *rootView, CGRect orginFrame, CGFloat xoffset) {
        // 使用简单的平移动画
        rootView.frame=CGRectMake(xoffset, orginFrame.origin.y, orginFrame.size.width, orginFrame.size.height);
    }];
    
    [self setUpAllChildViewController];
    
    [self setUpTabBar];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    DSLog(@"tabBar-->%@", self.tabBar.subviews);
    // 移除系统的tabbar
    for (UIView *tabBarBtn in self.tabBar.subviews) {
        if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarBtn removeFromSuperview];
        }
    }
}


/** 设置tabbar */
- (void)setUpTabBar
{
    // 自定义tabbar
    DSTabBarView *tabBar = [[DSTabBarView alloc] initWithFrame:self.tabBar.bounds];
    tabBar.items = self.items;
    tabBar.delegate = self;
    tabBar.backgroundColor = [UIColor whiteColor];
    // 添加自定义tabbar
    [self.tabBar addSubview:tabBar];
}

/** 加载子控制器,在iOS7中默认会把tabbar图片的颜色渲染成蓝色 */
- (void)setUpAllChildViewController
{
    // 电商医生
    DSDrCommerceViewController *hospital = [[DSDrCommerceViewController alloc] init];
    [self setUpOneChildViewController:hospital
                                image:[UIImage imageWithOriginalName:@"tabbar_home"]
                        selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"]
                                title:@"电商医生"];
    
    // 自我诊断
    DSSelfDiagnoseViewController *health = [[DSSelfDiagnoseViewController alloc] init];
    [self setUpOneChildViewController:health
                                image:[UIImage imageWithOriginalName:@"tabbar_discover"]
                        selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"]
                                title:@"自我诊断"];
    
    // 电商新闻
    DSMockController *news = [[DSMockController alloc] init];
    [self setUpOneChildViewController:news
                                image:[UIImage imageWithOriginalName:@"tabbar_profile"]
                        selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"]
                                title:@"电商新闻"];
    
    // 电商社区
    DSCommunityViewController *community = [[DSCommunityViewController alloc] init];
    [self setUpOneChildViewController:community
                                image:[UIImage imageWithOriginalName:@"tabbar_message_center"]
                        selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"]
                                title:@"电商社区"];
}

/** 添加一个控制器 */
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    viewController.title = title;
    viewController.tabBarItem.image = image;
//    viewController.tabBarItem.badgeValue = @"999";
    viewController.tabBarItem.selectedImage = selectedImage;
    // 保存tabbItem到数组
    [self.items addObject:viewController.tabBarItem];
    DSNavigationController *navigation = [[DSNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navigation];
}

/** TabBarView delegate method */
- (void)tabBar:(DSTabBarView *)tabBar didSelectedBtnAtIndex:(NSInteger)index
{
    self.selectedIndex = index;
}


@end
