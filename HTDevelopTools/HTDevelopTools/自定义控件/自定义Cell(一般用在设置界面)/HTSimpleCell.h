//
//  HTSimpleCell.h
//  HTDevelopTools
//
//  Created by HT on 2017/11/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
///以下style图文排列顺序 自左至右 均为居中显示
typedef enum : NSUInteger {
    HTSimpleCellStyle_ImageTitleRight = 0,          //图片 & 文字 & 右箭头
    HTSimpleCellStyle_TitleRight,                   //文字 & 右箭头
    HTSimpleCellStyle_ImageTitleDesc,               //图片 & 文字 & 详细描述文字
    HTSimpleCellStyle_ImageTitleDescRight           //图片 & 文字 & 详细描述文字 & 右箭头
}HTSimpleCellStyle;

@interface HTSimpleCell : UITableViewCell


/**
 左边图片 本地图片名字
 */
@property(nonatomic, copy)NSString *titleImageStr;

/**
 左边图片 网络图片地址
 */
@property(nonatomic, copy)NSString *titleImageURL;

/**
 cell的标题
 */
@property(nonatomic, copy)NSString *title;

/**
 右边图片 本地图片名字
 */
@property(nonatomic, copy)NSString *rightImageStr;

/**
 右边图片 网络图片地址
 */
@property(nonatomic, copy)NSString *rightImageURL;

/**
 title下方详细描述字符串 当且仅当style为(HTSimpleCellStyle_ImageTitleDesc ||              
 HTSimpleCellStyle_ImageTitleDescRight) 时有效
 */
@property(nonatomic, copy)NSString *descStr;

/**
 是否显示下方的分割线 default is YES
 */
@property(nonatomic, assign)BOOL isShowSegmentLine;

/**
 创建自定义的简单cell

 @param style cell的风格
 @param reuseIdentifier 标识符
 @return self
 */
+ (instancetype)simpleCellWithStyle:(HTSimpleCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
