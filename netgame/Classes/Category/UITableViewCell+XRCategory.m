//
//  UITableViewCell+XRCategory.m
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import "UITableViewCell+XRCategory.h"

@implementation UITableViewCell (XRCategory)

+ (void)registerWithTableView:(UITableView *)tableView
{
    NSString *reuseIdentifier = NSStringFromClass([self class]);
    if ([[NSBundle mainBundle] pathForResource:reuseIdentifier ofType:@".nib"]) {
        UINib *nib = [UINib nibWithNibName:reuseIdentifier bundle:[NSBundle mainBundle]];
        [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
    } else {
        [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
}

@end
