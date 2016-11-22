//
//  UIDevice+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XRScreenMatch) {
    XRScreenMatchClassic = 0, //iphone4,iphone5
    XRScreenMatchBigger,      //iphone6,
    XRScreenMatchBiggerPlus   //iphone6 Plus
};

@interface UIDevice (XRCategory)

/// YYCategories <https://github.com/ibireme/YYCategories>
/// Device system version (e.g. 8.1)
+ (float)systemVersion;
+ (CGFloat)matchScreenWithClassic:(CGFloat)Classic bigger:(CGFloat)bigger biggerPlus:(CGFloat)biggerPlus;

@end

#ifndef kSystemVersion
#define kSystemVersion [UIDevice systemVersion]
#endif

#ifndef kiOS6Later
#define kiOS6Later (kSystemVersion >= 6)
#endif

#ifndef kiOS7Later
#define kiOS7Later (kSystemVersion >= 7)
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif
