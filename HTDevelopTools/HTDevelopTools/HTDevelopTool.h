//
//  HTDevelopTool.h
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//
/*
                         gitHub:https://github.com/ProjectLion/HTDevelopTool.git
                                             *              *
                                           *   *          *   *
                                          *     *        *     *
                                         *  (&)  *      *  (&)  *
                                        *         *    *         *
                                       联系方式:htReturnTrue@163.com
                                             *               *
                                              *             *
                                               *           *
                                                *         *
                                                 *       *
                                                  *     *
                                                   * * *
 
*/
#ifndef HTDevelopTool_h
#define HTDevelopTool_h

/// 屏幕宽
#define SCREEN_W [UIScreen ht_screenWidth]
/// 屏幕高
#define SCREEN_H [UIScreen ht_screenHeight]
/// 宽适配
#define Width(w) [UIScreen ht_setWidth:(w)]
/// 高适配
#define Height(h) [UIScreen ht_setHeight:(h)]
/// 用屏幕宽适配的字体
#define FontWidth(fw) [UIFont systemFontOfSize:Width(fw)]
/// 用屏幕高适配的字体
#define FontHeight(fh) [UIFont systemFontOfSize:Height(fh)]
//颜色
#define colorForString(str) [UIScreen ht_colorWithHaxString:str]
/// 白色
#define WhiteColor [UIColor whiteColor]
/// 灰色
#define GrayColor [UIColor grayColor]
/// 黑色
#define BlackColor [UIColor blackColor]
/// 导航条的颜色
#define NavBgColor colorForString(@"f8f8f8")

/// 是否为iPhone X
#define ISIphoneX [UIScreen ht_isIphoneX]
/// 底部tabBar的高
#define TabBarH ISIphoneX ? 83.0 : 49.0
/// 导航条的高
#define NAVHeight ISIphoneX ? 88.0 : 64.0
/// 导航条上控件的Y值
#define NAVViewY ISIphoneX ? 44.0 : 20.0

#endif /* HTDevelopTool_h */

#ifdef __OBJC__

/***********     拓展工具    *****************/
#import "HTCategory.h"
/***********     拓展工具    *****************/

/***********   自定义的控件   *****************/
#import "HTCustomView.h"
/***********   自定义的控件   *****************/

/***********    其他工具类   ******************/
#import "HTOtherTools.h"
/***********    其他工具类   ******************/

#endif









