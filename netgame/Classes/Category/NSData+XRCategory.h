//
//  NSData+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <Foundation/Foundation.h>

/// YYCategories <https://github.com/ibireme/YYCategories>

@interface NSData (XRCategory)
/**
 Returns an encrypted NSData using AES.
 
 @param key   A key length of 16, 24 or 32 (128, 192 or 256bits).
 
 @param iv    An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.
 
 @return      An NSData encrypted, or nil if an error occurs.
 */
- (NSData *)aes256EncryptWithKey:(NSData *)key iv:(NSData *)iv;

/**
 Returns an decrypted NSData using AES.
 
 @param key   A key length of 16, 24 or 32 (128, 192 or 256bits).
 
 @param iv    An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.
 
 @return      An NSData decrypted, or nil if an error occurs.
 */
- (NSData *)aes256DecryptWithkey:(NSData *)key iv:(NSData *)iv;

- (NSString *)utf8String;

- (NSString *)hexString;
@end
