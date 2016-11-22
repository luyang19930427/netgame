//
//  UIBarButtonItem+Extension.h
//  game
//
//  Created by Lee on 16/4/28.
//  Copyright © 2016年 欣润科技. All rights reserved.
//
typedef enum : NSUInteger {
    left,
    right,
} Position;
#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (NSArray *)itemPosition:(Position)position target:(id)target action:(SEL)action title:(NSString *)title image:(NSString *)image highImage:(NSString *)highImage;
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title image:(NSString *)image highImage:(NSString *)highImage;

+(UIBarButtonItem *)itemWithUnreadLabel:(UILabel *)unreadLabel target:(id)target action:(SEL)action image:(NSString *)imageStr highImage:(NSString *)highImageStr;
+(UIBarButtonItem *)itemWithShotLabel:(UILabel *)shotLabel target:(id)target action:(SEL)action image:(NSString *)imageStr highImage:(NSString *)highImageStr;
@end
