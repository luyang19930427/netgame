//
//  UIDevice+XRCategory.m
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import "UIDevice+XRCategory.h"

@implementation UIDevice (XRCategory)

+ (float)systemVersion {
    static float version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.floatValue;
    });
    return version;
}

+ (XRScreenMatch) screenModel {
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat nativeWidth = screen.bounds.size.width;
    
    if (320 == nativeWidth) {
        return XRScreenMatchClassic;
    } else if (375 == nativeWidth) {
        return XRScreenMatchBigger;
    } else if (414 == nativeWidth) {
        return XRScreenMatchBiggerPlus;
    }
    return XRScreenMatchClassic;
}

+ (CGFloat)matchScreenWithClassic:(CGFloat)Classic bigger:(CGFloat)bigger biggerPlus:(CGFloat)biggerPlus {
    switch ([self screenModel]) {
        case XRScreenMatchClassic:
            return Classic;
            break;
        case XRScreenMatchBigger:
            return bigger;
            break;
        case XRScreenMatchBiggerPlus:
            return biggerPlus;
            break;
        default:
            break;
    }
}

@end
