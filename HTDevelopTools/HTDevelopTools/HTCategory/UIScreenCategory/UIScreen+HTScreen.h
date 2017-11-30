//
//  UIScreen+HTScreen.h
//  HT
//
//  Created by HT on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
//屏幕宽高
#define SCREEN_W [UIScreen ht_screenWidth]
#define SCREEN_H [UIScreen ht_screenHeight]
//宽高适配
#define Width(w) [UIScreen ht_setWidth:(w)]
#define Height(h) [UIScreen ht_setHeight:(h)]
//字体 颜色
#define FontWidth(fw) [UIFont systemFontOfSize:Width(fw)]
#define FontHeight(fh) [UIFont systemFontOfSize:Height(fh)]
#define colorForString(str) [UIScreen ht_colorWithHaxString:str]

@interface UIScreen (HTScreen)

/**
 获取设备屏幕size

 @return 屏幕size
 */
+ (CGSize)ht_screenSize;

/**
 获取设备屏幕宽

 @return 屏幕宽
 */
+ (CGFloat)ht_screenWidth;

/**
 获取设备屏幕高

 @return 屏幕高
 */
+ (CGFloat)ht_screenHeight;

/**
 适配，设置宽 (iPhone 6尺寸)

 @param width CGFloat
 @return 适配后的宽
 */
+ (CGFloat)ht_setWidth:(CGFloat)width;

/**
 适配，设置高 (iPhone 6尺寸)

 @param height CGFloat
 @return 适配后的高
 */
+ (CGFloat)ht_setHeight:(CGFloat)height;

/**
 根据颜色哈希值获取UIColor

 @param haxStr 哈希值
 @return UIColor
 */
+ (UIColor *)ht_colorWithHaxString:(NSString *)haxStr;

/**
 判断当前设备是否是Iphone X

 @return 是否是X
 */
+ (BOOL)ht_isIphoneX;

@end
