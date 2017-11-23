//
//  HTTableViewController.m
//  HTDevelopTools
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTTableViewController.h"

@interface HTTableViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_table;
}
@end

@implementation HTTableViewController

- (instancetype)initCustomNavWithTitle:(NSString *)title backBtnImageStr:(NSString *)backImageStr{
    if ([super initCustomNavWithTitle:title backBtnImageStr:backImageStr]) {
        _table = [UITableView ht_initTableWithX:0 y:0 width:SCREEN_W height:SCREEN_H - 64 style:0];
        [_table ht_setTableSeparatorStyle:0 separatorColor:[UIColor whiteColor] backGroundColor:[UIColor whiteColor]];
        _table.delegate = self;
        _table.dataSource = self;
        _table.rowHeight = Height(42);
        [self.BGView addSubview:_table];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HTSimpleCell *cell = [_table dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [HTSimpleCell simpleCellWithStyle:HTSimpleCellStyle_ImageTitleRight reuseIdentifier:@"cell"];
    }
    cell.title = @"停车服务";
    cell.titleImageStr = @"tuichu";
    cell.rightImageStr = @"tuichu";
    cell.isShowSegmentLine = YES;
    cell.selectionStyle = 0;
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
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
