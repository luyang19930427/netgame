//
//  XRTabBarViewController.m
//  game
//
//  Created by Lee on 16/4/28.
//  Copyright © 2016年 欣润科技. All rights reserved.
//
/*
#import "XRTabBarViewController.h"
#import "GameViewController.h"
#import "ChallengeViewController.h"
#import "TopicViewController.h"
#import "PersonalViewController.h"
#import "XRNavigationViewController.h"

@interface XRTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation XRTabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    NSArray *classNames = @[@"GameViewController",@"TopicViewController",@"PersonalViewController"];
    
    NSArray *tabBarStrings = @[NSLocalizedString(@"游戏", nil),NSLocalizedString(@"发现", nil),NSLocalizedString(@"我的", nil)];
    NSArray *tabBarImages = @[@"tabbar_game_normal",@"tabbar_find_normal",@"tabbar_personal_normal",@"tabbar_game_selected",@"tabbar_find_selected",@"tabbar_personal_selected"];
    NSMutableArray *controllers = [NSMutableArray array];
    for (int i = 0; i < classNames.count; i++) {
        Class currentClass = NSClassFromString(classNames[i]);
        controllers[i] = [[currentClass alloc] init];
        [self addChildVc:controllers[i] title:tabBarStrings[i] image:tabBarImages[i] selectedImage:tabBarImages[i + 3]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/
/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */

/*
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
//    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
//    childVc.tabBarItem.title = title;
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    if (kiOS7Later) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = XRThemeColor;
    selectTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateHighlighted];

    // 先给外面传进来的小控制器 包装 一个导航控制器
    XRNavigationViewController *nav = [[XRNavigationViewController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    return YES;
}

@end
 
 */
