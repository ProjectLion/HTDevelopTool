//
//  UITableView+HTTable.m
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UITableView+HTTable.h"

@implementation UITableView (HTTable)
/**
 创建table
 
 @param x frame.x
 @param y frame.y
 @param width frame.width
 @param height frame.height
 @param style UITableViewStyle
 @return self
 */
+ (instancetype)ht_initTableWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height style:(UITableViewStyle)style{
    return [[self alloc] initWithFrame:CGRectMake(x, y, width, height) style:style];
}
/**
 设置cell分割线 & table背景色
 
 @param separetorStyle 分割线风格
 @param separatorColor 分割线颜色
 @param backGroundColor 背景色
 */
- (void)ht_setTableSeparatorStyle:(UITableViewCellSeparatorStyle)separetorStyle separatorColor:(UIColor *)separatorColor backGroundColor:(UIColor *)backGroundColor{
    if (separetorStyle == 0) {
        self.backgroundColor = backGroundColor;
        self.separatorStyle = separetorStyle;
        return;
    }
    self.separatorStyle = separetorStyle;
    self.separatorColor = separatorColor;
    self.backgroundColor = backGroundColor;
}

/**
 设置table的刷新头视图 & 加载脚视图

 @param header MJRefreshHeader及其子类
 @param footer MJRefreshFooter及其子类
 */
- (void)ht_setRefreshHeader:(MJRefreshHeader *)header footer:(MJRefreshFooter *)footer{
    self.mj_header = header;
    self.mj_footer = footer;
}

@end
