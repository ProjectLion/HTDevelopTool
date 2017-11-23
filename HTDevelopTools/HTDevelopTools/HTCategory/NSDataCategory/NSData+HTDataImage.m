//
//  NSData+HTDataImage.m
//  HTDevelopTools
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "NSData+HTDataImage.h"

@implementation NSData (HTDataImage)
/**
 将图片转为data
 
 @param image image
 @return data
 */
+ (NSData *)ht_dataWithImage:(UIImage *)image{
    NSData *data;
    
    if (UIImagePNGRepresentation(image) == nil) {
        
        data = UIImageJPEGRepresentation(image, 1);
        
    }else {
        
        data = UIImageJPEGRepresentation(image, 0.01);
    }
    
    return data;
}

@end
