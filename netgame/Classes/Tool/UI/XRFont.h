//
//  XRFont.h
//  game
//
//  Created by luyang on 16/6/6.
//  Copyright © 2016年 欣润科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRFont : UIFont
+ (UIFont *)systemFontOfSize:(CGFloat)fontSize multiple:(CGFloat)multiple;
+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize multiple:(CGFloat)multiple;
+ (UIFont *)systemFontOfSize:(CGFloat)fontSize;
@end
