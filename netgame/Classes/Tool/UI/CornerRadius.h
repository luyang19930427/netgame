//
//  CornerRadius.h
//  CornerRadius
//
//  Created by linsir on 16/4/28.
//  Copyright © 2016年 linsir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CornerRadius : NSObject

@end

#pragma mark - UIView (cornerRadius)

@interface UIView (cornerRadius)

/**
 *  给label, button, textfield等添加圆角，默认borderWidth=1.0f, backgroundColor=whiteColor, borderColor=blackColor
 *
 *  @param radius 弧度
 */
- (void)addCornerRadius:(CGFloat)radius;

/**
 *  给label, button, textfield等添加圆角, 可以自定义其它的属性
 *
 *  @param radius          弧度
 *  @param borderWidth     borderWidth
 *  @param backgroundColor backgroundColor
 *  @param borderColor     borderColor
 */
- (void)addCornerRadius:(CGFloat)radius
               borderWidth:(CGFloat)borderWidth
           backgroundColor:(UIColor *)backgroundColor
              borderCorlor:(UIColor *)borderColor;

@end

#pragma mark - UIImageView (CornerRounder)

@interface UIImageView (CornerRounder)
/**
 *  给imageView设置圆角（加载本地图片，无占位图）
 *
 *  @param urlStr      本地图片地址
 *  @param radius      弧度
 *  @param borderWidth 边框宽度(0为无边框)
 *  @param borderColor 边框颜色
 */
- (void)xr_setLocalImageStr:(NSString *)urlStr radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderCorlor:(UIColor *)borderColor;

/**
 *  给imageView设置成纯圆形（加载网络图片）
 *
 *  @param urlStr         网络图片地址
 *  @param placeHolderStr 占位图
 */
- (void)xr_setCicleImageUrlStr:(NSString *)urlStr placeHolderImgName:(NSString *)placeHolderStr;

/**
 *  给imageView设置圆角（加载网络图片）
 *
 *  @param urlStr         网络图片地址
 *  @param placeHolderStr 占位图
 *  @param radius         弧度
 *  @param borderWidth    边框宽度(0为无边框)
 *  @param borderColor    边框颜色
 */
- (void)xr_setImageUrlStr:(NSString *)urlStr placeHolderImgName:(NSString *)placeHolderStr radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderCorlor:(UIColor *)borderColor;

@end


@interface UIImage (ImageCornerRounder)
/**
 *  改变image大小
 */
- (UIImage*)resizeImageToSize:(CGSize)targetSize;

/**
 *  给image设置圆角
 *
 *  @param radius       弧度
 *  @param size         图片size
 *  @param borderWidth  边框宽度(0为无边框)
 *  @param borderColor  边框颜色
 *
 *  @return 带圆角和边框的图片
 */
- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size borderWidth:(CGFloat)borderWidth borderCorlor:(UIColor *)borderColor;
@end
