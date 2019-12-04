//
//  UIWindow+WYWindowCategory.h
//  lmei
//
//  Created by Mac mini on 16/9/24.
//  Copyright © 2016年 Gaoxicee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WindowTapBlock)();

@interface UIWindow (WYWindowCategory)

@property (strong, nonatomic) UIView *maskView;
@property (strong, nonatomic) WindowTapBlock windowTapBlock;

// 网络监测
- (void)startCheckReachability;

// 添加和移除透明 view, 防止一个请求未完用户又触摸发起新的请求
- (void)addClearMaskView;
- (void)removeClearMaskView;

@end
