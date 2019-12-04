//
//  DetailHeaderCell.m
//  Demo
//
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
//

#import "DetailHeaderCell.h"

@implementation DetailHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
   self.one_view.layer.cornerRadius = 5.0f;
   self.one_view.layer.masksToBounds = YES;
   self.two_view.layer.cornerRadius = 5.0f;
   self.two_view.layer.masksToBounds = YES;
   self.third_view.layer.cornerRadius = 5.0f;
   self.third_view.layer.masksToBounds = YES;
}
- (IBAction)actionAllSizeBtn:(UIButton *)sender {
   if (self.DetailHeaderCellSizeBlock) {
      self.DetailHeaderCellSizeBlock();
   }
}
- (IBAction)actionTwoBtn:(UIButton *)sender {
   if (self.DetailHeaderCellProductBlock) {
      self.DetailHeaderCellProductBlock();
   }
}
- (IBAction)actionThirdBtn:(UIButton *)sender {
   if (self.DetailHeaderCellProductBlock) {
      self.DetailHeaderCellProductBlock();
   }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
