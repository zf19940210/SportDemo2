//  SubSettingCell.h
//  Demo
//  Created by 聚商码头 on 2019/12/3.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface SubSettingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *yin_pay_lab;
@property (weak, nonatomic) IBOutlet UILabel *no_pay_lab;
@property (nonatomic,copy)void(^SubSettingCellBlock)();
@end

NS_ASSUME_NONNULL_END
