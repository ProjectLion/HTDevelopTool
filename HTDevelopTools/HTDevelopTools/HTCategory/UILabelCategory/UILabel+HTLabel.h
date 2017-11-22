//
//  UILabel+HTLabel.h
//  HT
//
//  Created by HT on 2017/11/7.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HTLabel)


/**
 添加边框
 
 @param width 边框的宽
 @param color 边框颜色
 @param corner 需要裁剪圆角的大小
 */
- (void)ht_setLabelBorderWithWidth:(CGFloat)width borderColor:(nullable UIColor *)color corner:(CGFloat)corner;
/**
 设置label的字体(默认为系统12号字) 文本文字(默认为@"") 字体颜色(默认为黑色)

 @param font 文本字体
 @param text 文本文字
 @param textColor 字体颜色
 */
- (void)ht_setLabelFont:(nullable UIFont *)font text:(nullable NSString *)text textColor:(nullable UIColor *)textColor;


/**
 设置首行缩进

 @param string string
 @param num 缩进字符数量
 */
- (void)ht_setHeadIndentWithString:(nullable NSString *)string indentNum:(NSUInteger)num;

@end
