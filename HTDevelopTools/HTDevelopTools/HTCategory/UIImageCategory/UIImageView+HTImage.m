//
//  UIImageView+HTImage.m
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UIImageView+HTImage.h"
#import <YYWebImage.h>

@implementation UIImageView (HTImage)

/**
 加载网络图片(带默认图)
 
 @param url 图片地址
 @param placeholder 默认图片名字
 */
- (void)ht_loadImageWithURL:(NSString *)url placeholder:(NSString *)placeholder{
    if (placeholder == nil) {
        [self yy_setImageWithURL:[NSURL URLWithString:url] placeholder:nil options:YYWebImageOptionSetImageWithFadeAnimation | YYWebImageOptionShowNetworkActivity | YYWebImageOptionProgressive  completion:nil];
    }else{
        [self yy_setImageWithURL:[NSURL URLWithString:url] placeholder:[UIImage imageNamed:placeholder] options:YYWebImageOptionSetImageWithFadeAnimation | YYWebImageOptionShowNetworkActivity | YYWebImageOptionProgressive  completion:nil];
    }
}
/**
 加载本地图片
 
 @param imageString 图片名字
 */
- (void)ht_setLocationImageWithString:(NSString *)imageString{
    self.image = [UIImage imageNamed:imageString];
}
/**
 加载一张纯色图片
 
 @param color color
 */
- (void)ht_setImageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = image;
}

@end
