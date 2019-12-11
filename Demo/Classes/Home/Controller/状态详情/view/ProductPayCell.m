
//
//  ProductPayCell.m
//  Demo
//
//  Created by 聚商码头 on 2019/12/10.
//  Copyright © 2019 zhufeng. All rights reserved.
//

#import "ProductPayCell.h"

@implementation ProductPayCell

- (void)awakeFromNib {
    [super awakeFromNib];
   self.pay_btn.layer.cornerRadius = 8.0f;
   self.pay_btn.layer.masksToBounds = YES;
}
- (IBAction)actionPayBtn:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
