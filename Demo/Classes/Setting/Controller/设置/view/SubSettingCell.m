//  SubSettingCell.m
//  Demo
//  Created by 聚商码头 on 2019/12/3.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SubSettingCell.h"
@implementation SubSettingCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
/// 编辑商品
/// @param sender 编辑商品
- (IBAction)actionEditBtn:(UIButton *)sender
{
   if (self.SubSettingCellBlock) {
      self.SubSettingCellBlock();
   }
}
@end
