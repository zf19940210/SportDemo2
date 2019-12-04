//  HomeTitleCell.h
//  TestDemo2
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface HomeTitleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UILabel *all_lab;
@property (nonatomic,copy)void(^HomeTitleCellBlock) ();
@end

NS_ASSUME_NONNULL_END
