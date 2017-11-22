//
//  UIViewController+NoDataView.m
//  Technician
//
//  Created by appleLi on 2017/3/7.
//  Copyright © 2017年 LQL. All rights reserved.
//

#import "UIViewController+NoDataView.h"
#import "GDR_NoDataView.h"
#import <objc/runtime.h>

static const void *NoDataViewKey = &NoDataViewKey;
@implementation UIViewController (NoDataView)

- (GDR_NoDataView *)NoDataView{
    return objc_getAssociatedObject(self, NoDataViewKey);
}

- (void)setNoDataView:(GDR_NoDataView *)HUD{
    objc_setAssociatedObject(self, NoDataViewKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showNoDataViewWithFrame :(CGRect)frame{
//    GDR_NoDataView *noDataView= [[GDR_NoDataView alloc]initWithFrame:CGRectMake(0, [CalculateFrameView setHeight:200], [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64)];
    GDR_NoDataView *noDataView= [[GDR_NoDataView alloc]initWithFrame:frame];

    noDataView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:noDataView];
    [self setNoDataView:noDataView];
}

- (void)removeNoDataView{
    [[self NoDataView] removeFromSuperview];
}

@end
