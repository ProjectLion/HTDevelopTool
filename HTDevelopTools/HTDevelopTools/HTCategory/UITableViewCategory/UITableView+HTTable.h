//
//  UITableView+HTTable.h
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@interface UITableView (HTTable)


/**
 创建table

 @param x frame.x
 @param y frame.y
 @param width frame.width
 @param height frame.height
 @param style UITableViewStyle
 @return self
 */
+ (instancetype)ht_initTableWithX:(CGFloat)x
                                y:(CGFloat)y
                            width:(CGFloat)width
                           height:(CGFloat)height
                            style:(UITableViewStyle)style;

/**
 设置cell分割线 & table背景色

 @param separatorStyle 分割线风格
 @param separatorColor 分割线颜色
 @param backGroundColor 背景色
 */
- (void)ht_setTableSeparatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
                   separatorColor:(UIColor *)separatorColor
                  backGroundColor:(UIColor *)backGroundColor;

/**
 设置table的刷新头视图 & 加载脚视图
 
 @param header MJRefreshHeader及其子类
 @param footer MJRefreshFooter及其子类
 */
- (void)ht_setRefreshHeader:(MJRefreshHeader *)header footer:(MJRefreshFooter *)footer;

@end
