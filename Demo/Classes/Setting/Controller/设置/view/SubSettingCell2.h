//  SubSettingCell2.h
//  Demo
//  Created by 聚商码头 on 2019/12/3.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface SubSettingCell2 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *jilu_lab;
@property (nonatomic,copy)void(^SubSettingCell2Block)();
@end

NS_ASSUME_NONNULL_END
