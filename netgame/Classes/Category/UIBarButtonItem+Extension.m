//
//  UIBarButtonItem+Extension.m
//  game
//
//  Created by Lee on 16/4/28.
//  Copyright © 2016年 欣润科技. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 *  在左或右创建一个items数组
 *
 *  @param position  位置是left或right
 *  @param target    taget
 *  @param action    action
 *  @param title     按钮标题
 *  @param image     图片
 *  @param highImage 高亮图
 *
 *  @return 返回一个items数组
 */
+ (NSArray *)itemPosition:(Position)position target:(id)target action:(SEL)action title:(NSString *)title image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = kFontValue(14);
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    // 设置图片
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (highImage) {
        [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    // 设置尺寸
    btn.size = CGSizeMake(50, 30);
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    UIBarButtonItem *seperator = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    seperator.width = -10;
    NSArray <UIBarButtonItem *> *itemsArray = [NSArray array];
    switch (position) {
        case left:
            itemsArray = @[seperator,item];
            break;
        case right:
            itemsArray = @[seperator,item];
            break;
        default:
            break;
    }
    return itemsArray;
}
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title image:(NSString *)image highImage:(NSString *)highImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = kFontValue(13);
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    // 设置图片
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (highImage) {
        [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
/**
 *  创建带小红点消息通知按钮
 */
+(UIBarButtonItem *)itemWithUnreadLabel:(UILabel *)unreadLabel target:(id)target action:(SEL)action image:(NSString *)imageStr highImage:(NSString *)highImageStr{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (imageStr) {
        [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    }
    if (highImageStr) {
        [btn setBackgroundImage:[UIImage imageNamed:highImageStr] forState:UIControlStateHighlighted];
    }
    btn.size = btn.currentBackgroundImage.size;
    
    if (unreadLabel) {
        [unreadLabel setFrame:CGRectMake(btn.size.width -7, -5, 14, 14)];
        unreadLabel.tag = 200;
        unreadLabel.backgroundColor = [UIColor redColor];
        unreadLabel.textColor = [UIColor whiteColor];
        unreadLabel.layer.cornerRadius = unreadLabel.size.width / 2.f;
        unreadLabel.layer.masksToBounds = YES;
        unreadLabel.textAlignment = NSTextAlignmentCenter;
        unreadLabel.font = [UIFont systemFontOfSize:12];
        unreadLabel.hidden = YES;
        [btn addSubview:unreadLabel];
    }
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

/**
 *  创建带小红点截屏按钮
 */
+(UIBarButtonItem *)itemWithShotLabel:(UILabel *)shotLabel target:(id)target action:(SEL)action image:(NSString *)imageStr highImage:(NSString *)highImageStr{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (imageStr) {
        [btn setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    }
    if (highImageStr) {
        [btn setBackgroundImage:[UIImage imageNamed:highImageStr] forState:UIControlStateHighlighted];
    }
    btn.size = btn.currentBackgroundImage.size;
    
    if (shotLabel) {
        [shotLabel setFrame:CGRectMake(-10, -10, 20, 20)];
        
        shotLabel.backgroundColor = [UIColor colorWithHexColorString:@"f94e68"];
        shotLabel.textColor = [UIColor whiteColor];
        shotLabel.layer.cornerRadius = shotLabel.size.width / 2.f;
        shotLabel.layer.masksToBounds = YES;
        shotLabel.textAlignment = NSTextAlignmentCenter;
        shotLabel.font = [UIFont systemFontOfSize:14];
        shotLabel.hidden = YES;
        [btn addSubview:shotLabel];
    }
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
