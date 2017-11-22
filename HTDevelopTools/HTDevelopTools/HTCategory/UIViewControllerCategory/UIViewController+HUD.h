//
//  UIViewController+HTController.h
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

/**********依赖于MBProgress**********/

#import <UIKit/UIKit.h>


@interface UIViewController (HUD)

/**
 展示提示

 @param view superView
 @param hint 提示文字
 */
- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

/**
 隐藏提示
 */
- (void)hideHud;

/**
 展示提示在当前视图顶层

 @param hint 提示文字
 */
- (void)showHint:(NSString *)hint;

/**
 展示提示在当前视图顶层(可向Y轴方向偏移)

 @param hint 提示文字
 @param yOffset Y轴偏移量
 */
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

@end
