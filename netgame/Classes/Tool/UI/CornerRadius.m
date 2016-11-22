//
//  CornerRadius.m
//  CornerRadius
//
//  Created by linsir on 16/4/28.
//  Copyright © 2016年 linsir. All rights reserved.
//

#import "CornerRadius.h"

@interface CornerRadius ()

@end

@implementation CornerRadius

+ (CGFloat)ceilbyunit:(CGFloat)num unit:(double)unit {
    return num - modf(num, &unit) + unit;
}

+ (CGFloat)floorbyunit:(CGFloat)num unit:(double)unit {
    return num - modf(num, &unit);
}

+ (CGFloat)roundbyunit:(CGFloat)num unit:(double)unit {
    CGFloat remain = modf(num, &unit);
    if (remain > unit / 2.0) {
        return [self ceilbyunit:num unit:unit];
    } else {
        return [self floorbyunit:num unit:unit];
    }
}

+ (CGFloat)pixel:(CGFloat)num {
    CGFloat unit;
    CGFloat scale = [[UIScreen mainScreen] scale];
    switch ((NSInteger)scale) {
        case 1:
            unit = 1.0 / 1.0;
            break;
        case 2:
            unit = 1.0 / 2.0;
            break;
        case 3:
            unit = 1.0 / 3.0;
            break;
        default:
            unit = 0.0;
            break;
    }
    return [self roundbyunit:num unit:unit];
}


@end


#pragma mark - 针对UIView绘画出Image

@implementation UIView (cornerRadius)


- (void)addCornerRadius:(CGFloat)radius {
    [self addCornerRadius:radius
                 borderWidth:1.0f
             backgroundColor:[UIColor whiteColor]
                borderCorlor:[UIColor blackColor]];
}

- (void)addCornerRadius:(CGFloat)radius
               borderWidth:(CGFloat)borderWidth
           backgroundColor:(UIColor *)backgroundColor
              borderCorlor:(UIColor *)borderColor {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.layer.masksToBounds = YES;
    imageView.image = [self drawRectWithRoundedCornerRadius:radius borderWidth:borderWidth backgroundColor:backgroundColor borderCorlor:borderColor];
    if (self.superview) {
        [self.superview insertSubview:imageView belowSubview:self];
    }else{
        NSAssert(self.superview, @"not found the view's superView");
    }
}

- (UIImage *)drawRectWithRoundedCornerRadius:(CGFloat)radius
                                    borderWidth:(CGFloat)borderWidth
                                backgroundColor:(UIColor *)backgroundColor
                                   borderCorlor:(UIColor *)borderColor {
    CGSize sizeToFit = CGSizeMake([CornerRadius pixel:self.bounds.size.width], self.bounds.size.height);
    CGFloat halfBorderWidth = borderWidth / 2.0;
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor ? backgroundColor.CGColor :[UIColor whiteColor].CGColor);
 
    
    
    CGFloat width = sizeToFit.width, height = sizeToFit.height;
    CGContextMoveToPoint(context, width - halfBorderWidth, radius + halfBorderWidth); // 准备开始移动坐标
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius);
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius); // 左下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, radius); // 左上角
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, radius);
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end


#pragma mark - UIImageView (CornerRounder)

@implementation UIImageView (CornerRounder)

- (void)xr_setCicleImageUrlStr:(NSString *)urlStr placeHolderImgName:(NSString *)placeHolderStr {
    [self xr_setImageUrlStr:urlStr placeHolderImgName:placeHolderStr radius:self.frame.size.height / 2.0f borderWidth:0 borderCorlor:nil];
}
- (void)xr_setLocalImageStr:(NSString *)urlStr radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderCorlor:(UIColor *)borderColor{
    self.image = [self.image imageAddCornerWithRadius:radius andSize:self.frame.size borderWidth:borderWidth borderCorlor:borderColor];
}
- (void)xr_setImageUrlStr:(NSString *)urlStr placeHolderImgName:(NSString *)placeHolderStr radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderCorlor:(UIColor *)borderColor{

    NSURL *url = [NSURL URLWithString:urlStr];;
    UIImage *placeHolderImg = nil;
    if (placeHolderStr != nil) {
        placeHolderImg = [[UIImage imageNamed:placeHolderStr] imageAddCornerWithRadius:radius andSize:self.frame.size borderWidth:borderWidth borderCorlor:borderColor];
    }

    if (radius != 0) {
        //头像需要手动缓存处理成圆角的图片
        NSString *cacheurlStr = [urlStr stringByAppendingString:@"radiusCache"];
        UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheurlStr];
        if (cacheImage) {
            self.image = [cacheImage imageAddCornerWithRadius:radius andSize:self.frame.size borderWidth:borderWidth borderCorlor:borderColor];
        }
        else {
            [self sd_setImageWithURL:url placeholderImage:placeHolderImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (!error) {
                    UIImage *radiusImage = [image imageAddCornerWithRadius:radius andSize:self.frame.size borderWidth:borderWidth borderCorlor:borderColor];
                    self.image = radiusImage;
                    [[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheurlStr];
                    //清除原有非圆角图片缓存
                    [[SDImageCache sharedImageCache] removeImageForKey:urlStr];
                }
            }];
        }
    }
    else {
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeHolderStr] completed:nil];
    }
}

@end


#pragma mark - UIImage (ImageCornerRounder)


@implementation UIImage (ImageCornerRounder)

- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size borderWidth:(CGFloat)borderWidth borderCorlor:(UIColor *)borderColor{
    UIImage *reSizeImg = [self resizeImageToSize:CGSizeMake(size.width, size.height)];
//    XRLog(@"width:%f,hight:%f",reSizeImg.size.width,reSizeImg.size.height);
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(context,path.CGPath);
    CGContextClip(context);

    [reSizeImg drawInRect:rect];
    
    if (borderColor) {
        [borderColor set] ;
    }
    
    if (borderWidth != 0) {
        path.lineWidth = borderWidth;
        [path stroke];
    }
    
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//设置image大小
- (UIImage*)resizeImageToSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) ==NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor < heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor < heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    // this is actually the interesting part:
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, [UIScreen mainScreen].scale);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    return newImage ;
}
@end



