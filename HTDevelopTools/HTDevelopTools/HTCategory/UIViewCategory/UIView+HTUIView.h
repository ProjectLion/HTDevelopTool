//
//  UIView+HTUIView.h
//  HT
//
//  Created by HT on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end
