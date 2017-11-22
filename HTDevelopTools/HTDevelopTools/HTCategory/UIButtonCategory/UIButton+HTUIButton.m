//
//  UIButton+HTUIButton.m
//  HT
//
//  Created by HT on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UIButton+HTUIButton.h"

@implementation UIButton (HTUIButton)

/**
 设置按钮titleColor

 @param color color
 @param state state
 */
- (void)ht_setTitleColor:(UIColor *)color forState:(UIControlState)state{
    if (color == nil) {
        [self setTitleColor:[UIColor blackColor] forState:state];
        return;
    }
    [self setTitleColor:color forState:state];
}

/**
 设置按钮title

 @param title title
 @param state state
 */
- (void)ht_setTitle:(NSString *)title forState:(UIControlState)state{
    if (title == nil) {
        [self setTitle:@"" forState:state];
        return;
    }
    [self setTitle:title forState:state];
}

/**
 设置按钮的title font titleColor state
 
 @param title title         (可空 默认为@"")
 @param font font           (可空 默认为系统字体,大小12)
 @param color titleColor    (可空 默认为黑色)
 @param forState state
 */
- (void)ht_setButtonTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)color forState:(UIControlState)state{
    if (title == nil) {
        [self ht_setTitle:@"" forState:state];
    }else{
        [self ht_setTitle:title forState:state];
    }
    
    if (font == nil) {
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }else{
        self.titleLabel.font = font;
    }
    
    if (color == nil) {
        [self ht_setTitleColor:[UIColor blackColor] forState:state];
    }else{
        [self ht_setTitleColor:color forState:state];
    }
}

/**
 为按钮添加边框及圆角    (边框线的颜色可空,默认为黑色)
 
 @param borderWidth 边框线的宽
 @param borderColor 边框线的颜色
 @param corner 圆角大小
 */
- (void)ht_setButtonBorderWithWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor corner:(CGFloat)corner{
    //如果边框宽为0,即不存在边框,直接返回
    if (borderWidth == 0) {
        return;
    }
    self.layer.borderWidth = borderWidth;
    if (borderColor == nil) {
        self.layer.borderColor = [UIColor blackColor].CGColor;
    }else{
        self.layer.borderColor = borderColor.CGColor;
    }
    
    if (corner == 0) {
        return;
    }
    self.layer.cornerRadius = corner;
    self.clipsToBounds = YES;
}
/**
 设置按钮图片
 
 @param imgString 图片名称(本地)
 */
- (void)ht_setBtnImgWithString:(NSString *)imgString state:(UIControlState)state{
    if (imgString == nil) {
        return;
    }
    [self setImage:[UIImage imageNamed:imgString] forState:state];
}
/**
 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 
 @param style 图片排列的形式 (0为图左文右、1为图右文左、2为图上文下、3为图下文上)
 @param space 图片和标题的间隔
 */
- (void)ht_setBtnImageStyle:(HTButtonImageStyle)style space:(CGFloat)space{
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;                //image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + space / 2;                                 //image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2; //label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + space / 2;                                 //label中心移动的y距离
    
    switch (style) {
        case HTButtonImageStyle_Defult || HTButtonImageStyle_Left:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
            break;
            
        case HTButtonImageStyle_Right:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space/2, 0, -(labelWidth + space/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + space/2), 0, imageHeight + space/2);
            break;
            
        case HTButtonImageStyle_Top:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case HTButtonImageStyle_Bottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
}

/**
 设置按钮不同状态下的颜色(可空 默认白色)
 
 @param color 颜色
 @param state 状态
 */
- (void)ht_setBtnBackGroundColor:(UIColor *)color stata:(UIControlState)state{
    if (color == nil) {
        return;
    }
    [self setBackgroundImage:[UIButton ht_setImageWithColor:color] forState:state];
    
}
/**
 用颜色设置按钮的背景图片
 
 @param color 颜色
 @return 纯色图
 */
+ (UIImage *)ht_setImageWithColor:(UIColor *)color{
    if (color == nil) {
        CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
        CGContextFillRect(context, rect);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }else{
        CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
}

@end
