//
//  NSDictionary+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <Foundation/Foundation.h>

/// YYCategories <https://github.com/ibireme/YYCategories>

@interface NSDictionary (XRCategory)
/**
 Convert dictionary to json string. return nil if an error occurs.
 */
- (NSString *)jsonStringEncoded;

@end
