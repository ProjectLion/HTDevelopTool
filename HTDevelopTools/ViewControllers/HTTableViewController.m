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
        [self.BGView addSubview:_table];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HTSimpleCell *cell = [_table dequeueReusableCellWithIdentifier:@"cell"];
    switch (indexPath.row) {
        case 0:
            cell = [HTSimpleCell simpleCellWithStyle:HTSimpleCellStyle_ImageTitleRight reuseIdentifier:@"cell1"];
            break;
        case 1:{
            cell = [HTSimpleCell simpleCellWithStyle:HTSimpleCellStyle_TitleRight reuseIdentifier:@"cell2"];
        }
            break;
        case 2:{
            cell = [HTSimpleCell simpleCellWithStyle:HTSimpleCellStyle_ImageTitleDesc reuseIdentifier:@"cell3"];
        }
            break;
        default:
            cell = [HTSimpleCell simpleCellWithStyle:HTSimpleCellStyle_ImageTitleDescRight reuseIdentifier:@"cell4"];
            break;
    }
    cell.title = @"停车服务停车服务停车服停车";
    cell.descStr = @"铁血书生郭沫若停车服务停车服务停车服停车服务停车服务停车服停车服务停车服务停车服停车服务停车服务停车服停车服务停车服务停车服";
    cell.titleImageURL = @"http://36.111.166.37/zysh/userfiles/1/images/app/mall/appAdvert/2017/11/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20171012140612(1)%20(1)_%E5%89%AF%E6%9C%AC.jpg";
    cell.rightImageURL = @"http://36.111.166.37/zysh/userfiles/1/images/app/mall/appAdvert/2017/10/803845_1450923617098.jpg";
    cell.isShowSegmentLine = YES;
    cell.selectionStyle = 0;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return Height(44);
            break;
        case 1:{
            return Height(40);
        }
            break;
        case 2:{
            return Height(120);
        }
            break;
        default:
            return Height(160);
            break;
    }
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
