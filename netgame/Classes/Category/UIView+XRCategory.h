//
//  UIView+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XRLineType) {
    XRLineTypeLeft,
    XRLineTypeTop,
    XRLineTypeRight,
    XRLineTypeBottom,
    XRLineTypeHorizontalCenter,
    XRLineTypeVerticalCenter
};


@interface UIView (XRCategory)

- (UIView *)dt_addLineWithType:(XRLineType)type color:(UIColor *)color;

- (UIView *)dt_addLineWithType:(XRLineType)type color:(UIColor *)color offset:(CGFloat)offset;

- (UIView *)dt_addLineWithType:(XRLineType)type color:(UIColor *)color offset:(CGFloat)offset padding:(CGFloat)padding;

@end


@interface UIView (HUD)

- (void)showHud;

- (void)hideHud;

- (void)showHudWithMessage:(NSString *)messge;

- (void)showHudWithMessage:(NSString *)messge automaticallyHide:(BOOL)hide;

- (void)hideHudWithMessage:(NSString *)message;

@end

/**
 *  copy from YYCategories(https://github.com/ibireme/YYCategories)
 */
@interface UIView (Geometry)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

- (void)removeAllSubviews;
- (void)removeAllGestureRecognizers;

@end
