//  SearchProductCell.m
//  Demo
//  Created by 聚商码头 on 2019/11/30.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SearchProductCell.h"
@implementation SearchProductCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.bg_view.layer.cornerRadius = 10.0f;
    self.bg_view.layer.masksToBounds = YES;
}
@end
