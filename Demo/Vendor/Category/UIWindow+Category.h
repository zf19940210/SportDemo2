//  UIWindow+Category.h
//  JDJO
//  Created by 聚商码头 on 2019/7/7.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^WindowTapBlock)();
@interface UIWindow (Category)
@property (strong, nonatomic) UIView *maskView;
@property (strong, nonatomic) WindowTapBlock windowTapBlock;
// 添加和移除透明 view, 防止一个请求未完用户又触摸发起新的请求
- (void)addClearMaskView;
- (void)removeClearMaskView;
@end
NS_ASSUME_NONNULL_END
