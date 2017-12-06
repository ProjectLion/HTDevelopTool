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
{
    HTDatePickerView *dataPicker;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 50);
    [btn ht_setButtonTitle:@"推出时间选择器" titleFont:FontWidth(14) titleColor:[UIColor redColor] forState:0];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    timeLabel.textColor = [UIColor redColor];
    timeLabel.textAlignment = 1;
    timeLabel.text = @"时间";
    [self.view addSubview:timeLabel];
    
    dataPicker = [HTDatePickerView htDatePickerViewWithFrame:CGRectMake(0, SCREEN_H, SCREEN_W, Height(260)) style:HTDatePickerStyle_YMDhms];
    dataPicker.cancelBlock = ^{
        NSLog(@"取消");
    };
    dataPicker.ensureBlock = ^(NSString *date) {
        NSLog(@"时间是：%@", date);
        timeLabel.text = date;
    };
    dataPicker.isCanSelectCurrentTimeBefore = YES;
    dataPicker.buttonBorderColor = [UIColor redColor];
    dataPicker.cancelBtnColor = [UIColor redColor];
    [self.view addSubview:dataPicker];
    
}

- (void)clickBtn{
//    HTCustomVCViewController *vc = [[HTCustomVCViewController alloc] initCustomNavWithTitle:@"自定义导航条" backBtnImageStr:@"tuichu"];
//    [self presentViewController:vc animated:YES completion:nil];
    [dataPicker showDatePicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
