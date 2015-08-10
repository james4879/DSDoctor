//
//  DSImageCache.m
//  DSDoctor
//
//  Created by James on 4/23/15.
//  Copyright (c) 2015 James. All rights reserved.
//

#import "DSImageCache.h"

@implementation DSImageCache

static NSMutableDictionary *dict;

+ (NSString*)getPadImage:(NSString*)image{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        NSString * name = [image stringByDeletingPathExtension];
        NSString * extension = [image pathExtension];
        
        if ([name rangeOfString:@"_iPad"].location != NSNotFound) {
            NSLog(@"ImageCache: Warning: Filename(%@) already has the suffix %@. ", name, @"_iPad");
        }
        
        NSString * padName = [name stringByAppendingString:@"_iPad"];
        NSString * padImage=[padName stringByAppendingPathExtension:extension];
        if( [[NSBundle mainBundle] pathForResource:padImage ofType:@""] )
            return padImage;
        
        NSLog(@"ImageCache: iPad file(%@) not found", padImage );
        
        NSString * hdName = [name stringByAppendingString:@"@2x"];
        NSString * hdImage=[hdName stringByAppendingPathExtension:extension];
        if( [[NSBundle mainBundle] pathForResource:hdImage ofType:@""] )
            return hdImage;
        
        NSLog(@"ImageCache: HD file(%@) not found", hdImage );
    }
    
    return image;
}

+ (UIImage*)loadImage:(NSString*)imageName{
    if (!dict) dict = [NSMutableDictionary dictionary];
    
    imageName = [self getPadImage:imageName];
    imageName = [imageName lastPathComponent];
    UIImage* image = [dict objectForKey:imageName];
    if (!image){
        NSString* imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        image = [UIImage imageWithContentsOfFile:imagePath];
        if (image){
            [dict setObject:image forKey:imageName];
        }
    }
    
    return image;
}

+ (void)releaseCache {
    if (dict) {
        [dict removeAllObjects];
    }
}

@end

NSString *nib(NSString*name){
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        NSString *iPadName = [name stringByAppendingString:@"_iPad"];
        
        if( [[NSBundle mainBundle] pathForResource:iPadName ofType:@"nib"] )
            return iPadName;
        
        //NSLog(@"ImageCache: iPad file(%@) not found, use(%@)", iPadName,name );
    } else {
        NSString *iPhoneName = [name stringByAppendingString:@"_iPhone"];
        
        if( [[NSBundle mainBundle] pathForResource:iPhoneName ofType:@"nib"] )
            return iPhoneName;
        
        //NSLog(@"ImageCache: iPhone file(%@) not found, use(%@)", iPhoneName,name );
    }
    return name;
}
