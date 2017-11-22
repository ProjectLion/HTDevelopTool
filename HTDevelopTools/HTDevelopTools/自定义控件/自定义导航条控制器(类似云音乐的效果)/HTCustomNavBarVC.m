//
//  HTCustomNavBarVC.m
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTCustomNavBarVC.h"
#import "UIScreen+HTScreen.h"

@interface HTCustomNavBarVC ()
{
    UIView *topView;
    UIButton *backBtn;
    UILabel *title;
    UIButton *navRightBtn;
    UILabel *rightTitle;
}
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
- (void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    title.text = _navTitle;
}

- (void)setNavBackImageStr:(NSString *)navBackImageStr{
    _navBackImageStr = navBackImageStr;
    [backBtn setImage:[UIImage imageNamed:_navRightImageStr] forState:UIControlStateNormal];
}

- (void)setNavRightImageStr:(NSString *)navRightImageStr{
    _navRightImageStr = navRightImageStr;
    [navRightBtn setImage:[UIImage imageNamed:_navRightImageStr] forState:UIControlStateNormal];
}

- (void)setNavRightBtnTitleStr:(NSString *)navRightBtnTitleStr{
    _navRightBtnTitleStr = navRightBtnTitleStr;
    rightTitle.text = _navRightBtnTitleStr;
}

- (void)setNavBackGround:(UIColor *)navBackGround{
    _navBackGround = navBackGround;
    topView.backgroundColor = _navBackGround;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/*******************************/

- (void)creatNav{
    
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 64)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:_navBackImageStr] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(Width(10), 20, 44, 44);
    [backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backBtn];
    
    title = [[UILabel alloc] initWithFrame:CGRectMake(Width(125), 20, Width(130), 44)];
    title.text = _navTitle;
    title.font = FontWidth(17);
    title.textColor = [UIColor blackColor];
    title.textAlignment = 1;
    [topView addSubview:title];
    
    navRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [navRightBtn setImage:[UIImage imageNamed:_navRightImageStr] forState:UIControlStateNormal];
    [navRightBtn addTarget:self action:@selector(clickNavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    navRightBtn.frame = CGRectMake(Width(320), 20, 44, 44);
    [topView addSubview:navRightBtn];
    
    rightTitle = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_W - Width(150), 20, Width(130), 44)];
    rightTitle.text = _navRightBtnTitleStr;
    rightTitle.font = FontWidth(16);
    rightTitle.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickNavRightBtn)];
    [rightTitle addGestureRecognizer:tap];
    rightTitle.textColor = [UIColor grayColor];
    rightTitle.textAlignment = 2;
    [topView addSubview:rightTitle];
    
    if (_navRightBtnTitleStr == nil) {
        [rightTitle setHidden:YES];
    }
    
    if (_navBackImageStr == nil) {
        [backBtn setHidden:YES];
    }
    if (_navRightImageStr == nil){
        [navRightBtn setHidden:YES];
    }
    
}

- (void)creatMainBgView{
    if (_BGView == nil) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64)];
        _BGView = bgView;
        _BGView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_BGView];
    }
}

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
