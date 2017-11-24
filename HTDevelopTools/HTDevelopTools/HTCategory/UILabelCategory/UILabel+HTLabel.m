//
//  UILabel+HTLabel.m
//  HT
//
//  Created by HT on 2017/11/7.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UILabel+HTLabel.h"

@implementation UILabel (HTLabel)

/**
 添加边框

 @param width 边框的宽
 @param color 边框颜色
 @param corner 需要裁剪圆角的大小
 */
- (void)ht_setLabelBorderWithWidth:(CGFloat)width borderColor:(UIColor *)color corner:(CGFloat)corner{
    if (width == 0 || color == nil) {
        return;
    }
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = corner;
    self.clipsToBounds = YES;
}
/**
 设置label的字体(默认为系统12号字) 文本文字(默认为@"") 字体颜色(默认为黑色)
 
 @param font 文本字体
 @param text 文本文字
 @param textColor 字体颜色
 */
- (void)ht_setLabelFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor{
    if (font == nil) {
        self.font = [UIFont systemFontOfSize:12];
    }else{
        self.font = font;
    }
    
    if (textColor == nil) {
        self.textColor = [UIColor blackColor];
    }else{
        self.textColor = textColor;
    }
    if (text == nil) return;
    
    self.text = text;
}
/**
 设置首行缩进
 
 @param string string
 @param num 缩进字符数量
 */
- (void)ht_setHeadIndentWithString:(NSString *)string indentNum:(NSUInteger)num{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentLeft;   //左对齐
    style.headIndent = 0.0f;                 //行首缩进
    style.firstLineHeadIndent = self.font.pointSize * num;   //首行缩进 缩进当前字体大小的num个字符
    style.tailIndent = 0.0f;                 //行尾缩进
    style.lineSpacing = 2.0f;                //行间距
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:string attributes:@{NSParagraphStyleAttributeName: style}];
    self.attributedText = attStr;
}



@end
