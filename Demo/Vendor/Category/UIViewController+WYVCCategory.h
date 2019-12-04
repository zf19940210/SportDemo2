//
//  UIViewController+WYVCCategory.h
//  lmei
//
//  Created by Mac mini on 16/9/24.
//  Copyright © 2016年 Gaoxicee. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "JQIndicatorView.h
@interface UIViewController (WYVCCategory)
@property (strong, nonatomic) MBProgressHUD *mbProgressHUD;
@property (strong, nonatomic) UIView *maskView;
@property (strong, nonatomic) UIImageView * imageV;
// 界面通用配置
- (void)vcCommenConfigurations;

// MBProgressHUD
- (void)showMBProgressHUDWithText:(NSString *)text;// if text is nil, default to 加载中...
- (void)hideMBProgressHUDAfterDelay:(float)delay;
- (void)changeMBProgressHUDWithText:(NSString *)text;

//// tabbar 的显示与隐藏
//- (void)hideTabBar:(BOOL)hide;

// 添加和移除菊花
- (void)showMBProgressHUD;

//- (void)dismissMBProgressHUDAfterDelay:(float)delay;

// 添加和移除透明 view, 防止一个请求未完用户又触摸发起新的请求
- (void)addClearMaskView;
- (void)removeClearMaskView;

// tabbar 的显示与隐藏
- (void)hideTabBar:(BOOL)hide;

-(void)showCode:(NSString *)string;
@end
