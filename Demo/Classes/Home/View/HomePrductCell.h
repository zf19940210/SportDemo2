//
//  HomePrductCell.h
//  TestDemo2
//
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePrductCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *bg_view;
@property (weak, nonatomic) IBOutlet UIImageView *bg_img;
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UILabel *addree_lab;
@property (weak, nonatomic) IBOutlet UILabel *size_lab;
@property (weak, nonatomic) IBOutlet UILabel *price_lab;
@property (weak, nonatomic) IBOutlet UILabel *numeber_lab;
@end

NS_ASSUME_NONNULL_END
