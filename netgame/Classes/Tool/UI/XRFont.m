//
//  XRFont.m
//  game
//
//  Created by luyang on 16/6/6.
//  Copyright © 2016年 欣润科技. All rights reserved.
//

#import "XRFont.h"

@implementation XRFont
+ (UIFont *)systemFontOfSize:(CGFloat)fontSize {
    if (iPhone6plus) {
        return [super systemFontOfSize:fontSize *1.0];
    }else {
        return [super systemFontOfSize:fontSize];
    }
}
+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize {
    if (iPhone6plus) {
        return [super boldSystemFontOfSize:fontSize *1.0];
    }else {
        return [super boldSystemFontOfSize:fontSize];
    }
}
+ (UIFont *)systemFontOfSize:(CGFloat)fontSize multiple:(CGFloat)multiple {
    if (iPhone6plus) {
        return [super systemFontOfSize:fontSize *multiple];
    }else {
        return [super systemFontOfSize:fontSize];
    }
}
+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize multiple:(CGFloat)multiple {
    if (iPhone6plus) {
        return [super boldSystemFontOfSize:fontSize *multiple];
    }else {
        return [super boldSystemFontOfSize:fontSize];
    }
}

@end
