//
//  HTCustomNavBarVC.h
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//


/**  需继承于该基类,且需要将视图添加到self.BGView上,而非self.view  */



#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HTCustomNavBarVCStyle_Title,                    //只有title
    HTCustomNavBarVCStyle_BackTitle,                //返回按钮和title
    HTCustomNavBarVCStyle_BackTitleRightTitle,      //返回按钮 title 右边文字item
    HTCustomNavBarVCStyle_BackTitleRightImage       //返回按钮 title 右边图片item
}HTCustomNavBarVCStyle;

/**
 自定义导航条的基类
 */
@interface HTCustomNavBarVC : UIViewController

@property(nonatomic, weak)UIView *BGView;

/**
 当前控制器的tabBar时候被隐藏(默认为NO)
 */
@property(nonatomic, assign)BOOL isHaveTabBar;

///若没有使用自定义的init方法创建 则需要自己配置以下的属性
/**
 导航条背景色
 */
@property(nonatomic)UIColor *navBackGround;

/**
 导航条title
 */
@property(nonatomic, copy)NSString *navTitle;

/**
 右边item为图片的情况 图片的名字
 */
@property(nonatomic, copy)NSString *navRightImageStr;

/**
 返回按钮的图片名字
 */
@property(nonatomic, copy)NSString *navBackImageStr;

/**
 右边item为文字的情况 title
 */
@property(nonatomic, copy)NSString *navRightBtnTitleStr;

/**
 右边item的点击方法,具体实现由子类来控制
 */
- (void)clickNavRightBtn;

/**
 使用style构造自定义控制器需要单独设置具体的属性

 @param style 导航条的style
 @return self
 */
+ (instancetype)customNavWithStyle:(HTCustomNavBarVCStyle)style;

/**
 只有title
 
 @param title 导航条title
 @return self
 */
- (instancetype)initCustomNavWithTitle:(NSString *)title;

/**
 有title和返回按钮
 
 @param title 导航条title
 @param backImageStr 返回按钮的图片
 @return self
 */
- (instancetype)initCustomNavWithTitle:(NSString *)title backBtnImageStr:(NSString *)backImageStr;

/**
 有返回按钮  title  右边的按钮(image形式)
 
 @param title 导航条title
 @param backImageStr 返回按钮的imageString
 @param rightImageStr 右边按钮的imageString
 @return self
 */
- (instancetype)initCustomNavWithTitle:(NSString *)title backBtnImageStr:(NSString *)backImageStr rightBtnImageStr:(NSString *)rightImageStr;

/**
 有返回按钮 title  右边按钮(文字)
 
 @param title 导航条title
 @param backImageStr 返回按钮的imageString
 @param rightTitleStr 右边按钮的title
 @return self
 */
- (instancetype)initCustomNavWithTitle:(NSString *)title backBtnImageStr:(NSString *)backImageStr rightBtnTitleStr:(NSString *)rightTitleStr;

@end
