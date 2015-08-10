//
//  DSCaseController.m
//  DSDoctor
//
//  Created by James on 5/5/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSCaseController.h"
#import "CorePagesView.h"

#import "OrderListTVC.h"

// 行业案例
#import "DSIndustryController.h"
// 案例分类
#import "DSSortController.h"

#import "DSSideViewController.h"
#import "AppDelegate.h"
#import "DSTabBarView.h"

#import "DSNavigationController.h"

@interface DSCaseController () <DSTabBarViewDelegate>

@property (nonatomic, strong) CorePagesView *pagesView;

@end

@implementation DSCaseController

-(void)loadView{
    self.view=self.pagesView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    self.title = @"案例库";
    
    //LeftButton设置属性
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 40, 40)];
////    [leftButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)leftBtn
{
    NSLog(@"%s", __func__);
    [self.navigationController popViewControllerAnimated:YES];

}

-(CorePagesView *)pagesView{
    
    if(_pagesView==nil){
        
        // 行业案例
        DSIndustryController *list0TVC=[[DSIndustryController alloc] initWithStyle:UITableViewStylePlain];
        
        // 案例分类
        DSSortController *list1TVC=[[DSSortController alloc] initWithStyle:UITableViewStylePlain];

        // 封装方法
        CorePageModel *model0=[CorePageModel model:list0TVC pageBarName:@"    行业案例          "];
        CorePageModel *model1=[CorePageModel model:list1TVC pageBarName:@"          案例分类"];
        
        
        NSArray *pageModels=@[model0,model1];
        
        _pagesView=[CorePagesView viewWithOwnerVC:self pageModels:pageModels];
    }
    
    return _pagesView;
}

@end
