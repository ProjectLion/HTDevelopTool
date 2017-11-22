//
//  UIViewController+HTController.m
//  HT
//
//  Created by HT on 2017/11/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UIViewController+HTController.h"

@implementation UIViewController (HTController)

/**
 隐藏键盘
 */
- (void)ht_dismissKeyboard{
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(dismissKeyboardForClickAny:)];
    
    __weak UIViewController *weakSelf = self;
    
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [notification addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [weakSelf.view addGestureRecognizer:singleTapGR];
                }];
    [notification addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [weakSelf.view removeGestureRecognizer:singleTapGR];
                }];
}

- (void)dismissKeyboardForClickAny:(UIGestureRecognizer *)gestureRecognizer {
    [self.view endEditing:YES];
}

@end
