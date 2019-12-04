//  ProductHeaderView.h
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface ProductHeaderView : UIView
@property (nonatomic,strong) UIButton *but1;
@property (nonatomic,strong) UIButton *but2;
@property (nonatomic,strong) UIButton *but3;
@property (nonatomic,copy) void(^MoreButClickedBlock)(NSString *type,NSString *asc);
@end

NS_ASSUME_NONNULL_END
