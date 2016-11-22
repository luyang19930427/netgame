//
//  UICollectionViewCell+XRCategory.m
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import "UICollectionViewCell+XRCategory.h"

@implementation UICollectionViewCell (XRCategory)

+ (void)registerWithCollectionView:(UICollectionView *)collectionView
{
    NSString *reuseIdentifier = NSStringFromClass([self class]);
    if ([[NSBundle mainBundle] pathForResource:reuseIdentifier ofType:@".nib"]) {
        UINib *nib = [UINib nibWithNibName:reuseIdentifier bundle:[NSBundle mainBundle]];
        [collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    } else {
        [collectionView registerClass:[self class] forCellWithReuseIdentifier:reuseIdentifier];
    }
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
}

@end
