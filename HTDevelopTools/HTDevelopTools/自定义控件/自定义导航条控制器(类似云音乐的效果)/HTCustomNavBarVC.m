//
//  HTCustomNavBarVC.m
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTCustomNavBarVC.h"
#import "UIScreen+HTScreen.h"

#define ISIphoneX [UIScreen ht_isIphoneX]

@interface HTCustomNavBarVC ()
{
    CGFloat nav_height;
    CGFloat barY;
}
@property(nonatomic, strong)UIView *topView;
@property(nonatomic, strong)UIButton *backBtn;
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UIButton *navRightBtn;
@property(nonatomic, strong)UILabel *rightTitle;
@end

@implementation HTCustomNavBarVC

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = YES;
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark init方法

- (instancetype)init{
    self = [super init];
    if (self != nil) {
        [self creatNav];
        [self creatMainBgView];
    }
    return self;
}

- (instancetype)initCustomNavWithTitle:(NSString *)title{
    self = [super init];
    if (self != nil) {
        _navTitle = title;
        [self creatNav];
        [self creatMainBgView];
    }
    return self;
}

- (instancetype)initCustomNavWithTitle:(NSString *)title backBtnImageStr:(NSString *)backImageStr{
    self = [super init];
    if (self != nil) {
        _navTitle = title;
        _navBackImageStr = backImageStr;
        [self creatNav];
        [self creatMainBgView];
    }
    return self;
}

- (instancetype)initCustomNavWithTitle:(NSString *)title backBtnImageStr:(NSString *)backImageStr rightBtnImageStr:(NSString *)rightImageStr{
    self = [super init];
    if (self != nil) {
        _navTitle = title;
        _navBackImageStr = backImageStr;
        _navRightImageStr = rightImageStr;
        [self creatNav];
        [self creatMainBgView];
    }
    return self;
}

- (instancetype)initCustomNavWithTitle:(NSString *)title backBtnImageStr:(NSString *)backImageStr rightBtnTitleStr:(NSString *)rightTitleStr{
    self = [super init];
    if (self != nil) {
        _navTitle = title;
        _navBackImageStr = backImageStr;
        _navRightBtnTitleStr = rightTitleStr;
        [self creatNav];
        [self creatMainBgView];
    }
    return self;
}

/**
 使用style构造自定义控制器需要单独设置具体的属性
 
 @param style 导航条的style
 @return self
 */
+ (instancetype)customNavWithStyle:(HTCustomNavBarVCStyle)style{
    switch (style) {
        case HTCustomNavBarVCStyle_Title:{
            HTCustomNavBarVC *vc = [[HTCustomNavBarVC alloc] initCustomNavWithTitle:@""];
            return vc;
        }
            break;
        case HTCustomNavBarVCStyle_BackTitle:{
            HTCustomNavBarVC *vc = [[HTCustomNavBarVC alloc] initCustomNavWithTitle:@"" backBtnImageStr:@""];
            return vc;
        }
            break;
        case HTCustomNavBarVCStyle_BackTitleRightTitle:{
            HTCustomNavBarVC *vc = [[HTCustomNavBarVC alloc] initCustomNavWithTitle:@"" backBtnImageStr:@"" rightBtnTitleStr:@""];
            return vc;
        }
            break;
        case HTCustomNavBarVCStyle_BackTitleRightImage:{
            HTCustomNavBarVC *vc = [[HTCustomNavBarVC alloc] initCustomNavWithTitle:@"" backBtnImageStr:@"" rightBtnImageStr:@""];
            return vc;
        }
            break;
        default:
            return nil;
            break;
    }
}

/*******************************/
#pragma mark set方法
- (void)setIsHaveTabBar:(BOOL)isHaveTabBar{
    _isHaveTabBar = isHaveTabBar;
    /**
     *   如果是iPhone X并且tabBar没被隐藏
     */
    if (_isHaveTabBar) {
        if (ISIphoneX) {
            _BGView.ht_height = SCREEN_H - nav_height - 83;
        }else{
            _BGView.ht_height = SCREEN_H - nav_height - 49;
        }
    }
}

- (void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    self.titleLabel.text = _navTitle;
}

- (void)setNavBackImageStr:(NSString *)navBackImageStr{
    _navBackImageStr = navBackImageStr;
    [self.backBtn setImage:[UIImage imageNamed:_navRightImageStr] forState:UIControlStateNormal];
}

- (void)setNavRightImageStr:(NSString *)navRightImageStr{
    _navRightImageStr = navRightImageStr;
    [self.navRightBtn setImage:[UIImage imageNamed:_navRightImageStr] forState:UIControlStateNormal];
}

- (void)setNavRightBtnTitleStr:(NSString *)navRightBtnTitleStr{
    _navRightBtnTitleStr = navRightBtnTitleStr;
    self.rightTitle.text = _navRightBtnTitleStr;
}

- (void)setNavBackGround:(UIColor *)navBackGround{
    _navBackGround = navBackGround;
    self.topView.backgroundColor = _navBackGround;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/*******************************/
#pragma mark 懒加载视图控件
- (UIView *)topView{
    if (_topView == nil) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, nav_height)];
    }
    return _topView;
}

- (UIButton *)backBtn{
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _backBtn;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(Width(125), barY, Width(130), 44)];
    }
    return _titleLabel;
}

- (UIButton *)navRightBtn{
    if (_navRightBtn == nil) {
        _navRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _navRightBtn;
}

- (UILabel *)rightTitle{
    if (_rightTitle == nil) {
        _rightTitle = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_W - Width(150), barY, Width(130), 44)];
    }
    return _rightTitle;
}
/**
 *
 * *   创建导航条   *
 *
 */
- (void)creatNav{
    
    nav_height = ISIphoneX ? 88.0 : 64.0;
    barY = ISIphoneX ? 44.0 : 20.0;
    
    
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_topView];
    
    
    [self.backBtn setImage:[UIImage imageNamed:_navBackImageStr] forState:UIControlStateNormal];
    _backBtn.frame = CGRectMake(Width(10), barY, 44, 44);
    [_backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:_backBtn];
    
    self.titleLabel.text = _navTitle;
    _titleLabel.font = FontWidth(17);
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textAlignment = 1;
    [_topView addSubview:_titleLabel];
    
    
    [self.navRightBtn setImage:[UIImage imageNamed:_navRightImageStr] forState:UIControlStateNormal];
    [_navRightBtn addTarget:self action:@selector(clickNavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    _navRightBtn.frame = CGRectMake(Width(320), barY, 44, 44);
    [_topView addSubview:_navRightBtn];
    
    
    self.rightTitle.text = _navRightBtnTitleStr;
    _rightTitle.font = FontWidth(16);
    _rightTitle.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickNavRightBtn)];
    [_rightTitle addGestureRecognizer:tap];
    _rightTitle.textColor = [UIColor grayColor];
    _rightTitle.textAlignment = 2;
    [_topView addSubview:_rightTitle];
    
    if (_navRightBtnTitleStr == nil) {
        [_rightTitle setHidden:YES];
    }
    
    if (_navBackImageStr == nil) {
        [_backBtn setHidden:YES];
    }
    if (_navRightImageStr == nil){
        [_navRightBtn setHidden:YES];
    }
    
}

/**
 *
 * *   创建控制器背景视图   *
 *
 */
- (void)creatMainBgView{
    if (_BGView == nil) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, nav_height, SCREEN_W, SCREEN_H - nav_height)];
        _BGView = bgView;
        _BGView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_BGView];
    }
}
/**
 *
 * *   点击返回按钮   *
 *
 */
- (void)clickBackBtn{
    NSArray *arr = self.navigationController.viewControllers;
    if (arr.count > 0) {
        if ([arr objectAtIndex:arr.count - 1] == self) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
//    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *
 * *   点击右边barItem,具体实现交给子类重写   *
 *
 */
- (void)clickNavRightBtn{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
