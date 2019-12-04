//  HomeHeaderCell.h
//  TestDemo2
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
#import "UNScrollLabel.h"
NS_ASSUME_NONNULL_BEGIN
@interface HomeHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet SDCycleScrollView *scryllview;
@property (weak, nonatomic) IBOutlet UNScrollLabel *paomadneg_lab;
@property (nonatomic,strong)NSMutableArray *imgArr;
@end
NS_ASSUME_NONNULL_END
