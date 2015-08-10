//
//  DSNewsViewController.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSNewsViewController.h"
#import "DSView.h"

@interface DSNewsViewController ()

@end

@implementation DSNewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"电商新闻";
    
    CGRect frame =CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);//如果没有导航栏，则去掉64
    
    //对应填写两个数组
    NSArray *views =@[[DSView new], [DSView new], [DSView new], [DSView new], [DSView new]];
    NSArray *names =@[@"热点",@"专题",@"活动",@"商道",@"干货"];
    //创建使用
    self.scroll =[XLScrollViewer scrollWithFrame:frame withViews:views withButtonNames:names withThreeAnimation:111];//三中动画都选择
    
    //自定义各种属性。。打开查看
    self.scroll.xl_topBackImage =[UIImage imageNamed:@"tabBar_bg"];
//    self.scroll.xl_topBackColor =[UIColor yellowColor];
//    self.scroll.xl_sliderColor =[UIColor orangeColor];
    self.scroll.xl_buttonColorNormal =[UIColor grayColor];
    self.scroll.xl_buttonColorSelected =[UIColor blackColor];
    self.scroll.xl_buttonFont =12;
//    self.scroll.xl_buttonToSlider =20;
//    self.scroll.xl_sliderHeight =20;
    self.scroll.xl_topHeight =40;
    self.scroll.xl_isSliderCorner =YES;
    
    //加入控制器视图
    [self.view addSubview:self.scroll];
}

@end
