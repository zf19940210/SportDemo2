//  SizeSelectCell.m
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SizeSelectCell.h"
@implementation SizeSelectCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = RGB(240, 240, 240).CGColor;
    self.layer.borderWidth = 1.0f;
}
-(void)setSelected:(BOOL)selected{
   if (selected) {
      self.backgroundColor = RGB(237, 245, 234);
   }else{
      self.backgroundColor = [UIColor whiteColor];
   }
}
@end
