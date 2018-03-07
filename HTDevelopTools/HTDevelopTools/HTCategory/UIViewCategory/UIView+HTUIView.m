//
//  UIView+HTUIView.m
//  HT
//
//  Created by HT on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UIView+HTUIView.h"

@implementation UIView (HTUIView)

#pragma mark 视图的x、y、宽、高
- (CGFloat)ht_x{
    return self.frame.origin.x;
}

- (void)setHt_x:(CGFloat)ht_x{
    CGRect frame = self.frame;
    frame.origin.x = ht_x;
    self.frame = frame;
}

- (CGFloat)ht_y{
    return self.frame.origin.y;
}

- (void)setHt_y:(CGFloat)ht_y{
    CGRect frame = self.frame;
    frame.origin.y = ht_y;
    self.frame = frame;
}

- (CGFloat)ht_width{
    return self.frame.size.width;
}

- (void)setHt_width:(CGFloat)ht_width{
    CGRect frame = self.frame;
    frame.size.width = ht_width;
    self.frame = frame;
}

- (CGFloat)ht_height{
    return self.frame.size.height;
}

- (void)setHt_height:(CGFloat)ht_height{
    CGRect frame = self.frame;
    frame.size.height = ht_height;
    self.frame = frame;
}

#pragma mark 视图的上、下、左、右
- (CGFloat)ht_top{
    return self.frame.origin.y;
}

- (void)setHt_top:(CGFloat)ht_top{
    CGRect frame = self.frame;
    frame.origin.y = ht_top;
    self.frame = frame;
}

- (CGFloat)ht_bottom{
    return self.frame.origin.y + self.ht_height;
}

- (void)setHt_bottom:(CGFloat)ht_bottom{
    CGRect frame = self.frame;
    frame.origin.y = ht_bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)ht_left{
    return self.frame.origin.x;
}

- (void)setHt_left:(CGFloat)ht_left{
    CGRect frame = self.frame;
    frame.origin.x = ht_left;
    self.frame = frame;
}

- (CGFloat)ht_right{
    return self.frame.origin.x + self.ht_width;
}

- (void)setHt_right:(CGFloat)ht_right{
    CGRect frame = self.frame;
    frame.origin.x = ht_right - self.frame.size.width;
    self.frame = frame;
}
#pragma mark 视图的X轴、Y轴中心
- (CGFloat)ht_centerX{
    return self.center.x;
}

- (void)setHt_centerX:(CGFloat)ht_centerX{
    self.center = CGPointMake(ht_centerX, self.center.y);
}

- (CGFloat)ht_centerY{
    return self.center.y;
}

- (void)setHt_centerY:(CGFloat)ht_centerY{
    self.center = CGPointMake(self.center.x, ht_centerY);
}

- (void)ht_addBorderWith:(BorderPosition)position borderColor:(UIColor *)color borderWidth:(CGFloat)width{
    UIBezierPath *path = [UIBezierPath bezierPath];
    switch (position) {
        case BorderAll:
            self.layer.borderColor = color.CGColor;
            self.layer.borderWidth = width;
            break;
        case BorderOnTop:
            [path moveToPoint:CGPointMake(0.0, 0.0)];
            [path addLineToPoint:CGPointMake(self.ht_width, 0.0)];
        case BorderOnLeft:
            [path moveToPoint:CGPointMake(0.0, self.ht_height)];
            [path addLineToPoint:CGPointMake(0.0, 0.0)];
        case BorderOnBottom:
            [path moveToPoint:CGPointMake(0.0, self.ht_height)];
            [path addLineToPoint:CGPointMake(self.ht_width, self.ht_height)];
        case BorderOnRight:
            [path moveToPoint:CGPointMake(self.ht_width, 0.0)];
            [path addLineToPoint:CGPointMake(self.ht_width, self.ht_height)];
        default:
            break;
    }
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = path.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = width;
    
    [self.layer addSublayer:shapeLayer];
}

@end
