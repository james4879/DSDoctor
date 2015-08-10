//
//  DSImageCache.h
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSImageCache : NSObject

+ (UIImage*)loadImage:(NSString*)imageName;
+ (void)releaseCache;

@end

NSString* nib(NSString*name);
