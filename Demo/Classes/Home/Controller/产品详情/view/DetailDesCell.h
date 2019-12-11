//
//  DetailDesCell.h
//  Demo
//
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailDesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *status_lab;
@property (weak, nonatomic) IBOutlet UILabel *price_lab;
@property (weak, nonatomic) IBOutlet UIButton *bottom_lab;
@property (weak, nonatomic) IBOutlet UILabel *left_title_lab;

@end

NS_ASSUME_NONNULL_END
