//
//  DSMicroBlogFrame.m
//  DSDoctor
//
//  Created by Apple on 14/12/19.
//  Copyright (c) 2014年 James. All rights reserved.
//

#import "DSMicroBlogFrame.h"

#import "DSMicroBlog.h"

@implementation DSMicroBlogFrame

//计算文字的大小
- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
{
    CGSize nameSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    return nameSize;
}

//重写属性的setter方法，取得模型数据 计算frame  计算行高
- (void)setMicroBlog:(DSMicroBlog *)microBlog
{
    _microBlog = microBlog;
    CGFloat margin = 10;

    //头像
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //昵称
    CGSize nameSize = [self sizeWithText:self.microBlog.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:DSNameFont];
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + margin;
    CGFloat nameY = iconY + (iconH - nameSize.height)/2;
    _nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    //时间
    CGFloat timeW = 100;
    CGFloat timeH = 18;
    CGFloat timeY = nameY + margin*2;
    CGFloat timeX = CGRectGetMaxY(_iconFrame) + margin;
    _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    //会员
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    CGFloat vipY = nameY;
    CGFloat vipX = CGRectGetMaxY(_nameFrame) + margin;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    //标题
    CGFloat titleW = 300;
    CGFloat titleH = 14;
    CGFloat titleY = nameY + margin*4;
    CGFloat titleX = margin;
    _titleFrame = CGRectMake(titleX, titleY, titleW, titleH);
    //内容
    CGSize textSize = [self sizeWithText:self.microBlog.text maxSize:CGSizeMake(310, MAXFLOAT) fontSize:DSTextFont];
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + margin*4;
    _textFrame = (CGRect){{textX,textY},textSize}; //CGRectMake(textX, textY, textSize.width, textSize.height);
    
    //图片
    if (self.microBlog.picture) { // 有图片
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(_textFrame) + margin*2;
        _pictureFrame = (CGRect){{pictureX,pictureY},{pictureW,pictureH}};

        _rowHeight = CGRectGetMaxY(_pictureFrame) + margin;
        
        // 计算cellView的大小
        CGFloat cellW = 320;
        CGFloat cellH = DSCellViewH;
        CGFloat cellX = 0;
        CGFloat cellY = CGRectGetMaxY(_pictureFrame) + margin;
        _cellViewFrame = (CGRect){{cellX,cellY},{cellW,cellH}};
        // 有图片时，添加 cellView的高度
        _rowHeight = CGRectGetMaxY(_pictureFrame) + _cellViewFrame.size.height;

        
        // 计算出 来源
        CGFloat fromViewX = margin;
        CGFloat fromViewY = CGRectGetMaxY(_pictureFrame) + margin*2;
        CGFloat fromViewW = 100;
        CGFloat fromViewH = 30;
        _fromViewFrame = CGRectMake(fromViewX, fromViewY, fromViewW, fromViewH);
        
        // 计算点赞图标
        CGFloat praiseViewX = CGRectGetMaxX(_fromViewFrame) + 80;
        CGFloat praiseViewY = CGRectGetMaxY(_pictureFrame) + margin*2;
        CGFloat praiseViewW = 16;
        CGFloat praiseViewH = 16;
        _praiseViewImgFrame = CGRectMake(praiseViewX, praiseViewY, praiseViewW, praiseViewH);

        // 计算点赞数
        CGFloat praiseViewCountX = CGRectGetMaxX(_praiseViewImgFrame) + margin;
        CGFloat praiseViewCountY = CGRectGetMaxY(_pictureFrame) + margin*2;
        CGFloat praiseViewCountW = 30;
        CGFloat praiseViewCountH = 20;
        _praiseLabelCountFrame = CGRectMake(praiseViewCountX, praiseViewCountY,praiseViewCountW,praiseViewCountH);
       
        // 计算消息图标
        CGFloat messageViewX = CGRectGetMaxX(_praiseViewImgFrame) + 50;
        CGFloat messageViewY = CGRectGetMaxY(_pictureFrame) + margin *2;
        CGFloat messageViewW = 16;
        CGFloat messageViewH = 16;
        _messageViewImgFrame = CGRectMake(messageViewX, messageViewY, messageViewW, messageViewH);
        
        // 计算消息数
        CGFloat messageCountX = CGRectGetMaxX(_messageViewImgFrame) + margin;
        CGFloat messageCountY = CGRectGetMaxY(_pictureFrame) + margin *2;
        CGFloat messageCountW = 30;
        CGFloat messageCountH = 20;
        _messageViewCountFrame = CGRectMake(messageCountX, messageCountY, messageCountW, messageCountH);
        
    }else{
        // 计算cellView的大小
        CGFloat cellW = 320;
        CGFloat cellH = 44;
        CGFloat cellX = 0;
        CGFloat cellY = CGRectGetMaxY(_pictureFrame) + margin;
        _cellViewFrame = (CGRect){{cellX,cellY},{cellW,cellH}};
        // 无图片时，添加 cellView的高度
        _rowHeight = CGRectGetMaxY(_textFrame) + cellH;
        
        // 计算出 来源
        CGFloat fromViewX = margin;
        CGFloat fromViewY = CGRectGetMaxY(_textFrame) + margin;
        CGFloat fromViewW = 100;
        CGFloat fromViewH = 30;
        _fromViewFrame = CGRectMake(fromViewX, fromViewY, fromViewW, fromViewH);
        
        // 计算点赞图标
        CGFloat praiseViewX = CGRectGetMaxX(_fromViewFrame) + 80;
        CGFloat praiseViewY = CGRectGetMaxY(_textFrame) + margin;
        CGFloat praiseViewW = 16;
        CGFloat praiseViewH = 16;
        _praiseViewImgFrame = CGRectMake(praiseViewX, praiseViewY, praiseViewW, praiseViewH);
        
        // 计算点赞数
        CGFloat praiseViewCountX = CGRectGetMaxX(_praiseViewImgFrame) + margin;
        CGFloat praiseViewCountY = CGRectGetMaxY(_textFrame) + margin;
        CGFloat praiseViewCountW = 30;
        CGFloat praiseViewCountH = 20;
        _praiseLabelCountFrame = CGRectMake(praiseViewCountX, praiseViewCountY,praiseViewCountW,praiseViewCountH);
        
        // 计算消息图标
        CGFloat messageViewX = CGRectGetMaxX(_praiseViewImgFrame) + 50;
        CGFloat messageViewY = CGRectGetMaxY(_textFrame) + margin;
        CGFloat messageViewW = 16;
        CGFloat messageViewH = 16;
        _messageViewImgFrame = CGRectMake(messageViewX, messageViewY, messageViewW, messageViewH);
        
        // 计算消息数
        CGFloat messageCountX = CGRectGetMaxX(_messageViewImgFrame) + margin;
        CGFloat messageCountY = CGRectGetMaxY(_textFrame) + margin;
        CGFloat messageCountW = 30;
        CGFloat messageCountH = 20;
        _messageViewCountFrame = CGRectMake(messageCountX, messageCountY, messageCountW, messageCountH);
    }
    
}

@end
