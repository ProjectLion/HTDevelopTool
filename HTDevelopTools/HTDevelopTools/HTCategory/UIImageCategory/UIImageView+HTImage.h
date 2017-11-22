//
//  UIImageView+HTImage.h
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HTImage)


/**
 加载网络图片(带默认图)

 @param url 图片地址
 @param placeholder 默认图片名字
 */
- (void)ht_loadImageWithURL:(NSString *)url placeholder:(NSString *)placeholder;

/**
 加载本地图片

 @param imageString 图片名字
 */
- (void)ht_setLocationImageWithString:(NSString *)imageString;

/**
 加载一张纯色图片

 @param color color
 */
- (void)ht_setImageWithColor:(UIColor *)color;
@end
