//  SearchProductCell.h
//  Demo
//  Created by 聚商码头 on 2019/11/30.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface SearchProductCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *bg_view;
@property (weak, nonatomic) IBOutlet UIImageView *bg_img;
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UILabel *sub_title_lab;
@property (weak, nonatomic) IBOutlet UILabel *price_lab;
@end
NS_ASSUME_NONNULL_END
