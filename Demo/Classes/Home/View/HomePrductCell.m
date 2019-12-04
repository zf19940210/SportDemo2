//  HomePrductCell.m
//  TestDemo2
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "HomePrductCell.h"
@implementation HomePrductCell
- (void)awakeFromNib {
    [super awakeFromNib];
   self.bg_view.layer.cornerRadius = 20.0f;
   self.bg_view.layer.masksToBounds = YES;
}
@end
