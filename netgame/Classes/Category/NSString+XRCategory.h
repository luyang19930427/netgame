//
//  NSString+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <Foundation/Foundation.h>

/// YYCategories <https://github.com/ibireme/YYCategories>

@interface NSString (XRCategory)

/**
 Returns the height of the string if it were rendered with the specified constraints.
 
 @param font   The font to use for computing the string size.
 
 @param width  The maximum acceptable width for the string. This value is used
 to calculate where line breaks and wrapping would occur.
 
 @return       The height of the resulting string's bounding box. These values
 may be rounded up to the nearest whole number.
 */
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;

/**
 Returns a new UUID NSString
 e.g. "D1178E50-2A4D-4F1F-9BD3-F6AAB00E06B1"
 */
+ (NSString *)stringWithUUID;


- (BOOL)isQQ;
- (BOOL)isPhoneNumber;
- (BOOL)isCussorNumber;
- (BOOL)isPassword;
- (BOOL)isNickname;

@end

@interface NSString (Hash)

@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

@end
