//
//  DSQuestionController.m
//  DSDoctor
//
//  Created by James on 4/24/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSQuestionController.h"

@interface DSQuestionController ()

@property (nonatomic, weak) UIView *toolView;

@property (nonatomic, weak) UIButton *btn;

@end

@implementation DSQuestionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我要提问";
    
    // 导航栏提问按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"01"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(self.view.frame.size.width - 50, 0, 50, 25);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 文本框
    [self createText];
    
    // 工具条
    [self createTool];
    
    // 工具条按钮
    [self createToolBtn];
}

/** 创建文本框 */
- (void)createText
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(80, 44, self.view.frame.size.width, 100)];
    textField.placeholder = @"请详细描述您的问题";
    [self.view addSubview:textField];
}

/** 创建工具条 */
- (void)createTool
{
    UIView *toolView = [[UIView alloc] init];
    toolView.frame = CGRectMake(0, self.view.frame.size.height - 35, self.view.frame.size.width, 44);
    [self.view addSubview:toolView];
    self.toolView = toolView;
}

/** 创建工具条按钮 */
- (void)createToolBtn
{
    [self createToolButton:self.btn image:@"tb_02" imageframe:CGRectMake(90, 0, 35, 25) view:self.toolView];
    [self createToolButton:self.btn image:@"tb_03" imageframe:CGRectMake(170, 0, 25, 25) view:self.toolView];
    [self createToolButton:self.btn image:@"tb_04" imageframe:CGRectMake(250, 0, 35, 25) view:self.toolView];
}

/**
 *  封装工具条按钮
 *
 *  @param btn        工具条按钮
 *  @param imageName  按钮图片
 *  @param imageframe 按钮图片frame
 *  @param view       加载view
 */
- (void)createToolButton:(UIButton *)btn image:(NSString *)imageName imageframe:(CGRect)imageframe view:(UIView *)view
{
    btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.frame = imageframe;
    [view addSubview:btn];
}

@end
