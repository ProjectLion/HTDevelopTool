//
//  UIButton+HTUIButton.h
//  HT
//
//  Created by HT on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, HTButtonImageStyle){
    HTButtonImageStyle_Defult = 0,                              //图片在左 标题在右  默认
    HTButtonImageStyle_Left = HTButtonImageStyle_Defult,
    HTButtonImageStyle_Right = 1,                               //图片在右 标题在左
    HTButtonImageStyle_Top = 2,                                 //图片在上 标题在下
    HTButtonImageStyle_Bottom = 3,                              //图片在下 标题在上
};

@interface UIButton (HTUIButton)


/**
 设置按钮titleColor(color可空 默认为黑色)

 @param color color
 @param state state
 */
- (void)ht_setTitleColor:(nullable UIColor *)color forState:(UIControlState)state;

/**
 设置按钮title(title可空 默认为@"")

 @param title title
 @param state state
 */
- (void)ht_setTitle:(nullable NSString *)title forState:(UIControlState)state;

/**
 设置按钮的title font titleColor state

 @param title title         (可空 默认为@"")
 @param font font           (可空 默认为系统字体,大小12)
 @param color titleColor    (可空 默认为黑色)
 @param forState state
 */
- (void)ht_setButtonTitle:(nullable NSString *)title titleFont:(nullable UIFont *)font titleColor:(nullable UIColor *)color forState:(UIControlState)state;

/**
 为按钮添加边框及圆角    (边框线的颜色可空,默认为黑色)

 @param borderWidth 边框线的宽
 @param borderColor 边框线的颜色
 @param corner 圆角大小
 */
- (void)ht_setButtonBorderWithWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor corner:(CGFloat)corner;

/**
 设置按钮图片

 @param imgString 图片名称(本地)
 */
- (void)ht_setBtnImgWithString:(nullable NSString *)imgString state:(UIControlState)state;
/**
 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 
 @param style 图片排列的形式 (0为图左文右、1为图右文左、2为图上文下、3为图下文上)
 @param space 图片和标题的间隔
 */
- (void)ht_setBtnImageStyle:(HTButtonImageStyle)style space:(CGFloat)space;

/**
 设置按钮不同状态下的颜色(可空 默认白色)

 @param color 颜色
 @param state 状态
 */
- (void)ht_setBtnBackGroundColor:(nullable UIColor *)color stata:(UIControlState)state;

/**
 用颜色设置按钮的背景图片

 @param color 颜色
 @return 纯色图
 */
+ (nonnull UIImage *)ht_setImageWithColor:(nullable UIColor *)color;

@end
