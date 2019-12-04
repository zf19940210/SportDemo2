//  DetailImgCell.m
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "DetailImgCell.h"
@implementation DetailImgCell
-(void)setImgArr:(NSMutableArray *)imgArr
{
    _imgArr = imgArr;
    _scrollview.contentMode =  UIViewContentModeScaleToFill;
    _scrollview.imageURLStringsGroup = imgArr;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
