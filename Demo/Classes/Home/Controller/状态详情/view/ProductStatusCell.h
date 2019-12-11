//
//  ProductStatusCell.h
//  Demo
//
//  Created by 聚商码头 on 2019/12/10.
//  Copyright © 2019 zhufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductStatusCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *status_lab;
@property (weak, nonatomic) IBOutlet UILabel *sub_status_lab;

@end

NS_ASSUME_NONNULL_END
