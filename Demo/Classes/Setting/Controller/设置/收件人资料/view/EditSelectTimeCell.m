//  EditSelectTimeCell.m
//  Demo
//  Created by 聚商码头 on 2019/12/4.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "EditSelectTimeCell.h"
@implementation EditSelectTimeCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (IBAction)actionSelectTimeBtn:(UIButton *)sender
{
   int tag = (int)sender.tag;
   if (tag == 0) {
      [self.monerg_btn setImage:[UIImage imageNamed:@"1242-收件人_14"] forState:UIControlStateNormal];
      [self.after_btn setImage:[UIImage imageNamed:@"1242-收件人_11"] forState:UIControlStateNormal];
      [self.dinner_btn setImage:[UIImage imageNamed:@"1242-收件人_11"] forState:UIControlStateNormal];
   }else if(tag == 1){
      [self.monerg_btn setImage:[UIImage imageNamed:@"1242-收件人_11"] forState:UIControlStateNormal];
      [self.after_btn setImage:[UIImage imageNamed:@"1242-收件人_14"] forState:UIControlStateNormal];
      [self.dinner_btn setImage:[UIImage imageNamed:@"1242-收件人_11"] forState:UIControlStateNormal];
   }else if(tag == 2){
      [self.monerg_btn setImage:[UIImage imageNamed:@"1242-收件人_11"] forState:UIControlStateNormal];
      [self.after_btn setImage:[UIImage imageNamed:@"1242-收件人_11"] forState:UIControlStateNormal];
      [self.dinner_btn setImage:[UIImage imageNamed:@"1242-收件人_14"] forState:UIControlStateNormal];
   }
}
@end
