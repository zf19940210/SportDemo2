//  DetailHeaderCell.h
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface DetailHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *one_view;
@property (weak, nonatomic) IBOutlet UIView *two_view;
@property (weak, nonatomic) IBOutlet UIView *third_view;
@property (weak, nonatomic) IBOutlet UILabel *two_price_lab;
@property (weak, nonatomic) IBOutlet UILabel *two_size_lab;
@property (weak, nonatomic) IBOutlet UILabel *third_price_lab;
@property (weak, nonatomic) IBOutlet UILabel *third_size_lab;
@property (nonatomic,copy)void(^DetailHeaderCellSizeBlock)();
@property (nonatomic,copy)void(^DetailHeaderCellProductBlock)();
@end

NS_ASSUME_NONNULL_END
