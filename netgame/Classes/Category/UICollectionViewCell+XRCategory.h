//
//  UICollectionViewCell+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (XRCategory)

+ (void)registerWithCollectionView:(UICollectionView *)collectionView;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
