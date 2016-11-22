//
//  XRNavigationViewController.m
//  game
//
//  Created by Lee on 16/4/28.
//  Copyright © 2016年 欣润科技. All rights reserved.
//

#import "XRNavigationViewController.h"
//#import "FeedPresentCircleTransition.h"

@interface XRNavigationViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation XRNavigationViewController

+ (void)initialize
{
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    textAttrs[NSFontAttributeName] = kFontValue(18);
    textAttrs[UITextAttributeTextColor] = [UIColor whiteColor];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = textAttrs[NSFontAttributeName];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        self.transitioningDelegate = self;
//        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)setNavigationBarStyle:(XRNavigationBarStyle)navigationBarStyle {
    if (navigationBarStyle == XRNavigationBarStyleDefault) {
        self.navigationBar.barTintColor = XRThemeColor;
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
        
        textAttrs[NSFontAttributeName] = kFontValue(18);
        
        [self.navigationBar setTitleTextAttributes:textAttrs];
        self.navigationBar.tintColor = [UIColor whiteColor];
    }else {
        self.navigationBar.barTintColor = [UIColor whiteColor];
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
        textAttrs[NSFontAttributeName] = kFontValue(18);
        [self.navigationBar setTitleTextAttributes:textAttrs];
        self.navigationBar.tintColor = [UIColor blackColor];
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBarStyle = XRNavigationBarStyleDefault;
    self.navigationBar.translucent = YES;
}



/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
//         设置导航栏上面的内容 
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) title:nil image:@"icon_return_normal" highImage:@"icon_return_selected"];
        //开启ios右滑返回
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.delegate = nil;
        }
    }
    [super pushViewController:viewController animated:animated];
    viewController.view.backgroundColor = [UIColor whiteColor];
    

}

- (void)back{
    [self popViewControllerAnimated:YES];
}

//- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
//    return [FeedPresentCircleTransition transitionWithTransitionType:FeedPresentCircleTransitionTypePresent];
//}
//
//- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
//    return [FeedPresentCircleTransition transitionWithTransitionType:FeedPresentCircleTransitionTypeDismiss];
//}


@end
