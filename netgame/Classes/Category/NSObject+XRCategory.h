//
//  NSObject+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XRCategory)

- (NSDictionary *)allPropertyDictionaryWithNullValue:(id)nullValue;

- (void)performSelector:(SEL)sel afterDelay:(NSTimeInterval)delay;

@end
