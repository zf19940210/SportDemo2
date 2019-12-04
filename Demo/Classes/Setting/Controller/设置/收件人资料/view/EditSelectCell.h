//
//  EditSelectCell.h
//  Demo
//
//  Created by 聚商码头 on 2019/12/4.
//  Copyright © 2019 zhufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditSelectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UITextField *content_tf;
@property (weak, nonatomic) IBOutlet UIImageView *up_img;

@end

NS_ASSUME_NONNULL_END
