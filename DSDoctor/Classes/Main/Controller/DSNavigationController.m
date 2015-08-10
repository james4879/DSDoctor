//
//  DSNavigationController.m
//  DSDoctor
//
//  Created by Chenghui on 15/5/4.
//  Copyright (c) 2015年 James. All rights reserved.
//

#import "DSNavigationController.h"
#import "UIBarButtonItem+Item.h"

@interface DSNavigationController ()

@end

@implementation DSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    viewController.hidesBottomBarWhenPushed = YES;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    [super pushViewController:viewController animated:animated];
}

+ (void)initialize
{
    // 获取当前类下面的UIBarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    // 设置导航条按钮的文字颜色
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
}

/**
 *  出栈
 */
- (void)popToRoot
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
