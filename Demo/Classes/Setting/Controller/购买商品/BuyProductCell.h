//  BuyProductCell.h
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BuyProductCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *sub_title_lab2;
@property (weak, nonatomic) IBOutlet UILabel *sub_title_lab;
@property (weak, nonatomic) IBOutlet UILabel *time_lab;
@property (weak, nonatomic) IBOutlet UILabel *status_lab;
@property (weak, nonatomic) IBOutlet UILabel *price_lab;
@property (weak, nonatomic) IBOutlet UIImageView *icon_img;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left_layout;
@end
NS_ASSUME_NONNULL_END
