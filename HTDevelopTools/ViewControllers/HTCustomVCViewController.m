//
//  HTCustomVCViewController.m
//  HTDevelopTools
//
//  Created by apple on 2017/11/22.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTCustomVCViewController.h"
#import "PPNumberButton.h"
#import "HTTableViewController.h"

@interface HTCustomVCViewController ()

@end

@implementation HTCustomVCViewController

- (instancetype)initCustomNavWithTitle:(NSString *)title backBtnImageStr:(NSString *)backImageStr{
    if ([super initCustomNavWithTitle:title backBtnImageStr:backImageStr]) {
        [self creat];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)creat{
    PPNumberButton *numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(100, 300, 100, 80)];
    numberButton.borderColor = [UIColor grayColor];
    numberButton.increaseTitle = @"＋";
    numberButton.decreaseTitle = @"－";
    numberButton.currentNumber = 777;
    numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    [self.BGView addSubview:numberButton];
    
    PPNumberButton *numberButton1 = [PPNumberButton numberButtonWithStyle:PPNumberButtonStyle_vertical frame:CGRectMake(200, 200, 30, 100)];
    // 初始化时隐藏减按钮
    numberButton1.decreaseHide = YES;
    numberButton1.increaseImage = [UIImage imageNamed:@"tuichu"];
    numberButton1.decreaseImage = [UIImage imageNamed:@"tuichu"];
    numberButton1.maxValue = 100;
    numberButton1.shakeAnimation = YES;
    numberButton1.currentNumber = 100;
    numberButton1.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    
    [self.BGView addSubview:numberButton1];
    
    PPNumberButton *numberButton2 = [PPNumberButton numberButtonWithStyle:PPNumberButtonStyle_horizon frame:CGRectMake(100, 400, 100, 70)];
    // 初始化时隐藏减按钮
    numberButton2.decreaseHide = YES;
    numberButton2.increaseImage = [UIImage imageNamed:@"tuichu"];
    numberButton2.decreaseImage = [UIImage imageNamed:@"tuichu"];
    numberButton2.currentNumber = 11;
    numberButton2.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    [self.BGView addSubview:numberButton2];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 50);
    [btn ht_setButtonTitle:@"跳转" titleFont:FontWidth(14) titleColor:[UIColor redColor] forState:0];
    [btn addTarget:self action:@selector(clickBtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.BGView addSubview:btn];
}

- (void)clickBtn1{
    HTTableViewController *tableVC = [[HTTableViewController alloc] initCustomNavWithTitle:@"退出" backBtnImageStr:@"tuichu"];
    [self presentViewController:tableVC animated:YES completion:nil];
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
