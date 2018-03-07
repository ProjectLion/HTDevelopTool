//
//  UIView+HTUIView.h
//  HT
//
//  Created by HT on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BorderPosition) {
    BorderAll,
    BorderOnTop,
    BorderOnLeft,
    BorderOnBottom,
    BorderOnRight
};

@interface UIView (HTUIView)


/**
 view的x
 */
@property(nonatomic, assign)CGFloat ht_x;

/**
 view的y
 */
@property(nonatomic, assign)CGFloat ht_y;

/**
 view的宽
 */
@property(nonatomic, assign)CGFloat ht_width;

/**
 view的高
 */
@property(nonatomic, assign)CGFloat ht_height;

/**
 view的上
 */
@property(nonatomic, assign)CGFloat ht_top;

/**
 view的下
 */
@property(nonatomic, assign)CGFloat ht_bottom;

/**
 view的左
 */
@property(nonatomic, assign)CGFloat ht_left;

/**
 view的右
 */
@property(nonatomic, assign)CGFloat ht_right;

/**
 view的X轴中心
 */
@property(nonatomic, assign)CGFloat ht_centerX;

/**
 view的Y轴中心
 */
@property(nonatomic, assign)CGFloat ht_centerY;     

/**
 在指定位置填加边框
 
 @param position 边框位置
 @param color 边框颜色
 @param width 边框宽
 */
- (void)ht_addBorderWith:(BorderPosition)position borderColor:(UIColor *)color borderWidth:(CGFloat)width;

@end
