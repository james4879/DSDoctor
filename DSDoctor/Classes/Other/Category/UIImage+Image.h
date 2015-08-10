//
//  UIImage+Image.h
//  JJWeibo
//
//  Created by James on 3/3/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/** 加载没有被系统渲染的原始图片 */
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

/** 拉伸图片 */
+ (UIImage *)imageWithStretchableName:(NSString *)imageName;

@end
