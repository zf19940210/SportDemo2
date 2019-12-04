//  HomeHeaderCell.m
//  TestDemo2
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "HomeHeaderCell.h"
@implementation HomeHeaderCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
-(void)setImgArr:(NSMutableArray *)imgArr
{
    _imgArr = imgArr;
    _scryllview.imageURLStringsGroup = imgArr;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
