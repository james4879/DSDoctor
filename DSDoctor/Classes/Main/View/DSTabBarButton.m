//
//  DSTabBarButton.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSTabBarButton.h"
#import "DSBadgeView.h"

#define JJImageRidio 0.7

@interface DSTabBarButton ()

@property (nonatomic, strong) DSBadgeView *badgeView;

@end

@implementation DSTabBarButton

- (DSBadgeView *)badgeView
{
    if (!_badgeView) {
        DSBadgeView *btn = [DSBadgeView buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _badgeView = btn;
    }
    return _badgeView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置属性,图片
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        //文字
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

/** 传递tabbarItem的值给tabbarButton */
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    //kvo赋值
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
}

/** 监听的属性的值改变就会调用 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    //设置badgeView
    self.badgeView.badgeValue = self.item.badgeValue;
}

/** 设置子控件的frame */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //图片
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * JJImageRidio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    //文字
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    //badge
    self.badgeView.x = self.width - self.badgeView.width - 10;
    self.badgeView.y = 0;
}

@end
