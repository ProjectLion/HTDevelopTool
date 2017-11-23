//
//  NSData+HTDataImage.h
//  HTDevelopTools
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (HTDataImage)


/**
 将图片转为data

 @param image image
 @return data
 */
+ (NSData *)ht_dataWithImage:(UIImage *)image;

@end
