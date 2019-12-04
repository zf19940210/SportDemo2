//  DetailImgCell.h
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface DetailImgCell : UITableViewCell
@property (weak, nonatomic) IBOutlet SDCycleScrollView *scrollview;
@property (nonatomic,strong)NSMutableArray *imgArr;
@end

NS_ASSUME_NONNULL_END
