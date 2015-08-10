//
//  DSTabBarView.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSTabBarView.h"
#import "DSTabBarButton.h"

@interface DSTabBarView ()

@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, strong) UIButton *selectedBtn;

@end

@implementation DSTabBarView

- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

/** 重写setter方法给模型赋值 */
- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UITabBarItem *item in _items) {
        DSTabBarButton *button = [DSTabBarButton buttonWithType:UIButtonTypeCustom];
        button.item = item;
        button.tag = self.buttons.count;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        if (button.tag == 0) {
            [self btnClick:button];
        }
        [self addSubview:button];
        [self.buttons addObject:button];
    }
}

/** 点击tabbar */
- (void)btnClick:(UIButton *)button
{
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    //通知tabbar切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedBtnAtIndex:)]) {
        [self.delegate tabBar:self didSelectedBtnAtIndex:button.tag];
    }
    NSLog(@"%ld", button.tag);
}

/** 设置子控件frame */
- (void)layoutSubviews
{
    [super layoutSubviews];
    DSLog(@"%@", self.subviews);
    
    //tabbar的大小
    CGFloat w = self.bounds.size.width;
    //    CGFloat h = self.bounds.size.height;
    //按钮的位置和大小
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count);
    CGFloat btnH = self.bounds.size.height;
    //设置tabbar上的按钮的frame
    NSInteger index = 0;
    for (UIView *tabBarBtn in self.buttons) {
        NSLog(@"%ld", index);
        btnX = index * btnW;
        tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        index ++;
    }
}

@end
