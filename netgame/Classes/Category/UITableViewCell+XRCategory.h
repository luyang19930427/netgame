//
//  UITableViewCell+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (XRCategory)

+ (void)registerWithTableView:(UITableView *)tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@end
