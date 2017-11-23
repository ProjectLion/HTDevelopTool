//
//  ViewController.m
//  HTDevelopTools
//
//  Created by apple on 2017/11/22.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ViewController.h"
#import "HTCustomVCViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 50);
    [btn ht_setButtonTitle:@"跳转" titleFont:FontWidth(14) titleColor:[UIColor redColor] forState:0];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)clickBtn{
    HTCustomVCViewController *vc = [[HTCustomVCViewController alloc] initCustomNavWithTitle:@"自定义导航条" backBtnImageStr:@"tuichu"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
