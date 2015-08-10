//
//  DSFirstController.m
//  DSDoctor
//
//  Created by James on 4/28/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSFirstController.h"
//#import "DSNewsViewController.h"

@interface DSFirstController ()

@property (nonatomic, weak) UIView *textView;

@end

@implementation DSFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    
    // 初始化布局
    UIView *textView = [[UIView alloc] init];
    textView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:textView];
    self.textView = textView;
}

/** 取消按钮 */
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
