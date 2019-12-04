//  SubSettingCell3.h
//  Demo
//  Created by 聚商码头 on 2019/12/3.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface SubSettingCell3 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *address_lab;
@property (nonatomic,copy)void(^SubSettingCell3Block)();
@end

NS_ASSUME_NONNULL_END
