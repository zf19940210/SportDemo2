//  HomeTitleCell.m
//  TestDemo2
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "HomeTitleCell.h"

@implementation HomeTitleCell
- (IBAction)acitonBtn:(id)sender {
   if (self.HomeTitleCellBlock) {
      self.HomeTitleCellBlock();
   }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
