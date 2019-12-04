//
//  EditContentCell.h
//  Demo
//
//  Created by 聚商码头 on 2019/12/4.
//  Copyright © 2019 zhufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UITextField *content_tf;
@end

NS_ASSUME_NONNULL_END
