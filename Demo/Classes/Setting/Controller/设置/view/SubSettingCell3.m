//  SubSettingCell3.m
//  Demo
//  Created by 聚商码头 on 2019/12/3.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SubSettingCell3.h"
@implementation SubSettingCell3
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
/// 编辑地址
/// @param sender 编辑地址
- (IBAction)actionEditBtn:(UIButton *)sender
{
   if (self.SubSettingCell3Block) {
      self.SubSettingCell3Block();
   }
}
@end
