//
//  UIView+XRCategory.m
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import "UIView+XRCategory.h"
#import <objc/runtime.h>

@implementation UIView (XRCategory)

- (UIView *)dt_addLineWithType:(XRLineType)type color:(UIColor *)color {
    return [self dt_addLineWithType:type color:color offset:0 padding:0];
}

- (UIView *)dt_addLineWithType:(XRLineType)type color:(UIColor *)color offset:(CGFloat)offset {
    return [self dt_addLineWithType:type color:color offset:offset padding:0];
}

- (UIView *)dt_addLineWithType:(XRLineType)type color:(UIColor *)color offset:(CGFloat)offset padding:(CGFloat)padding {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    
    switch (type) {
        case XRLineTypeLeft: {
            line.frame = CGRectMake(0 + offset, 0 + padding, 0.5, CGRectGetHeight(self.frame) - 2 * padding);
            break;
        }
        case XRLineTypeTop: {
            line.frame = CGRectMake(0 + padding, 0 + offset, CGRectGetWidth(self.frame) - 2 * padding, 0.5);
            break;
        }
        case XRLineTypeRight: {
            line.frame = CGRectMake(CGRectGetWidth(self.frame) - 0.5 - offset, 0 + padding, 0.5, CGRectGetHeight(self.frame) - 2 * padding);
            break;
        }
        case XRLineTypeBottom: {
            line.frame = CGRectMake(0 + padding, CGRectGetHeight(self.frame) - 0.5 - offset, CGRectGetWidth(self.frame) - 2 * padding, 0.5);
            break;
        }
        case XRLineTypeHorizontalCenter: {
            line.frame = CGRectMake(0 + padding, CGRectGetHeight(self.frame) / 2, CGRectGetWidth(self.frame) - 2 * padding, 0.5);
            break;
        }
        case XRLineTypeVerticalCenter: {
            line.frame = CGRectMake(CGRectGetWidth(self.frame) / 2, 0 + padding, 0.5, CGRectGetHeight(self.frame) - 2 * padding);
            break;
        }
    }
    
    [self addSubview:line];
    return line;
}

@end


@implementation UIView (HUD)

- (void)showHud {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
}

- (void)hideHud {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)showHudWithMessage:(NSString *)messge {
    [self showHudWithMessage:messge automaticallyHide:YES];
}

- (void)showHudWithMessage:(NSString *)messge automaticallyHide:(BOOL)hide {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    if (messge) {
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.font = hud.label.font;
        hud.detailsLabel.text = messge;
    }
    hud.removeFromSuperViewOnHide = YES;
    if (hide) {
        [hud hideAnimated:YES afterDelay:1.5];
    }
}

- (void)hideHudWithMessage:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud) {
        hud.detailsLabel.font = hud.label.font;
        hud.detailsLabel.text = message;
        [hud hideAnimated:YES afterDelay:1.5];
    }
}

@end

@implementation UIView (Geometry)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    self.frame     = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame   = self.frame;
    frame.origin.y = y;
    self.frame     = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame   = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame     = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame   = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame     = frame;
}


- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)removeAllSubviews {
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[UIView class]]) {
            [subview removeFromSuperview];
        }
        
    }
}

- (void)removeAllGestureRecognizers {
    for (UIGestureRecognizer *gestureRecognizer in self.gestureRecognizers) {
        [self removeGestureRecognizer:gestureRecognizer];
    }
}

@end

