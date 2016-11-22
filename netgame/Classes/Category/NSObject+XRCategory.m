//
//  NSObject+XRCategory.m
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import "NSObject+XRCategory.h"
#import <objc/runtime.h>

@implementation NSObject (XRCategory)

- (NSArray *)allPropertyNames
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *names = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [names addObject:name];
    }
    
    free(properties);
    
    return names;
}

- (NSDictionary *)allPropertyDictionaryWithNullValue:(id)nullValue {
    NSArray *names = [self allPropertyNames];
    
    NSArray *ignoredKeys = @[@"debugDescription", @"description", @"hash", @"superclass"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [names enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([ignoredKeys containsObject:obj]) {
            return ;
        }
        id value = [self valueForKey:obj];
        if (!value) {
            if (nullValue) {
                value = nullValue;
            } else {
                value = @"";
            }
        }
        
        [dict setObject:value forKey:obj];
    }];
    return dict;
}

- (void)performSelector:(SEL)selector afterDelay:(NSTimeInterval)delay {
    [self performSelector:selector withObject:nil afterDelay:delay];
}

@end
