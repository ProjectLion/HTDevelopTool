//
//  UIScreen+HTScreen.h
//  HT
//
//  Created by HT on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UIScreen+HTScreen.h"

@implementation UIScreen (HTScreen)

/**
 获取设备屏幕size
 
 @return 屏幕size
 */
+ (CGSize)ht_screenSize{
    return [[UIScreen mainScreen] bounds].size;
}
/**
 获取设备屏幕宽
 
 @return 屏幕宽
 */
+ (CGFloat)ht_screenWidth{
    return [[UIScreen mainScreen] bounds].size.width;
}
/**
 获取设备屏幕高
 
 @return 屏幕高
 */
+ (CGFloat)ht_screenHeight{
    return [[UIScreen mainScreen] bounds].size.height;
}
/**
 适配，设置宽 (iPhone 6尺寸)
 
 @param width CGFloat
 @return 适配后的宽
 */
+ (CGFloat)ht_setWidth:(CGFloat)width {
    CGFloat screenWidth = SCREEN_W;
    CGFloat newWidth = (width / 375.0) * screenWidth;
    return newWidth;
}
/**
 适配，设置高 (iPhone 6尺寸)
 
 @param height CGFloat
 @return 适配后的高
 */
+ (CGFloat)ht_setHeight:(CGFloat)height {
    CGFloat screenHeight = SCREEN_H;
    CGFloat newHeight = (height / 667.0) * screenHeight;
    return newHeight;
}
/**
 根据颜色哈希值获取UIColor
 
 @param haxStr 哈希值
 @return UIColor
 */
+ (UIColor *)ht_colorWithHaxString:(NSString *)haxStr{
    NSString *cString = [[haxStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


/**
 判断当前设备是否是iPhone X

 @return 是否是X
 */
+ (BOOL)ht_isIphoneX{
    if (SCREEN_W == 375.0 && SCREEN_H == 812.0) {
        return YES;
    }
    return NO;
}

@end
