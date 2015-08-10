//
//  DSMicroBlogCell.m
//  DSDoctor
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 James. All rights reserved.
//

#import "DSMicroBlogCell.h"
#import "DSMicroBlog.h"
#import "DSMicroBlogFrame.h"
@interface DSMicroBlogCell ()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameView;
@property (nonatomic, weak) UILabel *timeView;
@property (nonatomic, weak) UILabel *titleView;
@property (nonatomic, weak) UIImageView *vipView;
@property (nonatomic, weak) UILabel *textView;
@property (nonatomic, weak) UIImageView *pictureView;

// cell底部视图的 来源控件
@property (nonatomic, weak) UILabel *fromView;
@property (nonatomic, weak) UIImageView *praiseView;
@property (nonatomic, weak) UILabel *praiseLabelView;
@property (nonatomic, weak) UIImageView *messageView;
@property (nonatomic, weak) UILabel *messageLabelView;
@end

@implementation DSMicroBlogCell

//1 创建可以重用的自定义cell的对象
+ (instancetype)microBlogCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"blog";
    DSMicroBlogCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;
}

//2 重写构造方法，初始化（创建自定义cell内部的子控件）
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       //创建子控件
       //头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        self.iconView.layer.cornerRadius = 15;
        self.iconView.layer.masksToBounds = YES;
        //昵称
        UILabel *nameView = [[UILabel alloc] init];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        nameView.font = [UIFont systemFontOfSize:DSNameFont];
        //发表时间
        UILabel *timeView = [[UILabel alloc] init];
        [self.contentView addSubview:timeView];
        timeView.alpha = 0.5;
        self.timeView = timeView;
        timeView.font = [UIFont systemFontOfSize:DSTextFont];
        //标题
        UILabel *titleView = [[UILabel alloc] init];
        [self.contentView addSubview:titleView];
        self.titleView = titleView;
        titleView.font = [UIFont systemFontOfSize:DSTitleFont];
        //会员
        UIImageView *vipView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        //内容
        UILabel *textView = [[UILabel alloc] init];
        [self.contentView addSubview:textView];
        self.textView = textView;
        textView.font = [UIFont systemFontOfSize:DSTextFont];
        textView.numberOfLines = 0;
        //图片
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
        
        //来源
        UILabel *fromView = [[UILabel alloc] init];
        [self.contentView addSubview:fromView];
        fromView.alpha = 0.3;
        fromView.font = [UIFont systemFontOfSize:DSTextFont];
        self.fromView = fromView;
        
        //点赞图标
        UIImageView *praiseView = [[UIImageView alloc] init];
        [self.contentView addSubview:praiseView];
        self.praiseView = praiseView;
        
        //点赞数
        UILabel *praiseCount = [[UILabel alloc] init];
        [self.contentView addSubview:praiseCount];
        self.praiseLabelView = praiseCount;
        
        //消息图标
        UIImageView *messageImg = [[UIImageView alloc] init];
        [self.contentView addSubview:messageImg];
        self.messageView = messageImg;
        
        //消息数
        UILabel *messageCount = [[UILabel alloc] init];
        [self.contentView addSubview:messageCount];
        self.messageLabelView = messageCount;
        
    }
    return self;
}

- (void)setMicroBlogFrame:(DSMicroBlogFrame *)microBlogFrame
{
    _microBlogFrame = microBlogFrame;
    //设置子控件显示的内容
    [self setSubViewsContent];
    //设置子控件的frame
    [self setSubViewsFrame];
}

//设置子控件显示的内容
- (void)setSubViewsContent
{
    DSMicroBlog *microBlog = self.microBlogFrame.microBlog;
    self.iconView.image = [UIImage imageNamed:microBlog.icon];
    self.nameView.text = microBlog.name;
    
    //新添加时间和标题
    self.timeView.text = microBlog.time;
    self.titleView.text = microBlog.title;
    
    //如果不是会员，隐藏
    if (!microBlog.isVip) {
        //非会员
        self.vipView.hidden = YES;
    }else{
        self.vipView.hidden = NO;
    }
    self.textView.text = microBlog.text;
    if(microBlog.picture)
    {
        self.pictureView.image = [UIImage imageNamed:microBlog.picture];
    }
    
    //来源
    self.fromView.text = microBlog.from;
    
    //点赞图片
    self.praiseView.image = [UIImage imageNamed:microBlog.praiseImg];
    
    //点赞数
    self.praiseLabelView.text = microBlog.praiseLabel;
    
    // 消息图标
    self.messageView.image = [UIImage imageNamed:microBlog.messageImg];
    
    // 消息数
    self.messageLabelView.text = microBlog.messageLabel;
}
//设置子控件的frame
- (void)setSubViewsFrame
{
    self.iconView.frame = self.microBlogFrame.iconFrame;
    self.nameView.frame = self.microBlogFrame.nameFrame;
    self.vipView.frame = self.microBlogFrame.vipFrame;
    self.textView.frame = self.microBlogFrame.textFrame;
    self.pictureView.frame = self.microBlogFrame.pictureFrame;
    
    //新添加时间和标题
    self.timeView.frame = self.microBlogFrame.timeFrame;
    self.titleView.frame = self.microBlogFrame.titleFrame;
   
    //添加来源
    self.fromView.frame = self.microBlogFrame.fromViewFrame;
    
    //点赞图片
    self.praiseView.frame = self.microBlogFrame.praiseViewImgFrame;
    
    //点赞数
    self.praiseLabelView.frame = self.microBlogFrame.praiseLabelCountFrame;
    self.praiseLabelView.alpha = 0.3;
   
    //消息图标
    self.messageView.frame = self.microBlogFrame.messageViewImgFrame;
    
    //消息数
    self.messageLabelView.frame = self.microBlogFrame.messageViewCountFrame;
    self.messageLabelView.alpha = 0.3;
}

@end
