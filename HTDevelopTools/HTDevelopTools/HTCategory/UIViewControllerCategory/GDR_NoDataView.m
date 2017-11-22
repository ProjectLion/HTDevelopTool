//
//  GDR_NoDataView.m
//  Technician
//
//  Created by appleLi on 2017/3/7.
//  Copyright © 2017年 LQL. All rights reserved.
//

#import "GDR_NoDataView.h"
#import "UIScreen+HTScreen.h"

@implementation GDR_NoDataView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    UIImageView *noNetworkImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width(100), Width(100))];
    noNetworkImageView.center = CGPointMake(self.frame.size.width / 2, (self.frame.size.height - 64)/ 2 - Height(30));
    noNetworkImageView.image = [UIImage imageNamed:@"nodata.png"];
    [self addSubview:noNetworkImageView];
    
    
    UILabel *noDataLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, Height(30))];
    noDataLable.center = CGPointMake(self.frame.size.width / 2, (self.frame.size.height - 64)/ 2 + Height(50));
    noDataLable.backgroundColor = [UIColor clearColor];
    noDataLable.text = @"暂无数据";
    noDataLable.textColor = [UIColor lightGrayColor];
    noDataLable.font = [UIFont systemFontOfSize:13];
    noDataLable.textAlignment = 1;
    [self addSubview:noDataLable];
//    for (GDR_NoDataView *view in [self getCurrentViewController].view.subviews) {
//        if ([view isMemberOfClass:[GDR_NoNetworkingView class]]) {
//            [view removeFromSuperview];
//        }
//    }
}

//- (UIViewController *)getCurrentViewController {
//    for (UIView* next = [self superview]; next; next = next.superview) {
//        UIResponder *nextResponder = [next nextResponder];
//        if ([nextResponder isKindOfClass:[UIViewController class]]) {
//            return (UIViewController *)nextResponder;
//        }
//    }
//    return nil;
//}
@end
