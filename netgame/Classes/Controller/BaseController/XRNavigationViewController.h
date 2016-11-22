//
//  XRNavigationViewController.h
//  game
//
//  Created by Lee on 16/4/28.
//  Copyright © 2016年 欣润科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FeedPresentedControllerDelegate <NSObject>

- (void)presentedOneControllerPressedDissmiss;
- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;

@end

@interface XRNavigationViewController : UINavigationController
typedef NS_ENUM(NSInteger, XRNavigationBarStyle) {
    XRNavigationBarStyleDefault                                     = 0, // Light content, for use on dark backgrounds
    XRNavigationBarStyleDarkContent     NS_ENUM_AVAILABLE_IOS(7_0) = 1, // Dark content, for use on light backgrounds
};

@property (nonatomic,weak) id<FeedPresentedControllerDelegate> presentedDelegate;

@property(nonatomic, assign) XRNavigationBarStyle navigationBarStyle;


@end
