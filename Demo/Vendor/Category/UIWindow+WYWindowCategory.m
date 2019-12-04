//
//  UIWindow+WYWindowCategory.m
//  lmei
//
//  Created by Mac mini on 16/9/24.
//  Copyright © 2016年 Gaoxicee. All rights reserved.
//

#import "UIWindow+WYWindowCategory.h"
#import <objc/runtime.h>

/**
 *  利用运行时的动态绑定, 伪实现类目添加属性的效果
 */
static char const * const maskViewKey = "maskView";
static char const * const windowTapBlockKey = "windowTapBlock";

@implementation UIWindow (WYWindowCategory)

@dynamic maskView;
@dynamic windowTapBlock;

#pragma mark - 网络监测

- (void)startCheckReachability {
    
    UILabel *notReachableLabel = [[UILabel alloc] init];
    notReachableLabel.backgroundColor = [UIColor blackColor];
    notReachableLabel.alpha = 0.618;
    notReachableLabel.text = @"请检查是否连接网络";
    notReachableLabel.textColor = [UIColor whiteColor];
    notReachableLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:notReachableLabel];
    notReachableLabel.hidden = YES;
    [notReachableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(Height_NavBar);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(0);
    }];
    
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusUnknown) {
            
            notReachableLabel.hidden = NO;
            
            [UIView animateWithDuration:0.25 animations:^{
                
                [notReachableLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    
                    make.height.mas_equalTo(44);
                }];
                [self layoutIfNeeded];
            }];
        }else if (status == AFNetworkReachabilityStatusNotReachable) {
            
            notReachableLabel.hidden = NO;
            
            [UIView animateWithDuration:0.25 animations:^{
                
                [notReachableLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    
                    make.height.mas_equalTo(44);
                }];
                
                [self layoutIfNeeded];
            }];
        }else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"HAVEINTERNET" object:@(3)];
            notReachableLabel.hidden = YES;
    
            [UIView animateWithDuration:0.25 animations:^{
                
                [notReachableLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    
                    make.height.mas_equalTo(0);
                }];
                
                [self layoutIfNeeded];
            }];
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"HAVEINTERNET" object:@(4)];
            notReachableLabel.hidden = YES;
     
            [UIView animateWithDuration:0.25 animations:^{
                
                [notReachableLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    
                    make.height.mas_equalTo(0);
                }];
                
                [self layoutIfNeeded];
            }];
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


#pragma mark - maskView

- (id)maskView {
    
    return objc_getAssociatedObject(self, maskViewKey);
}

- (void)setMaskView:(UIView *)maskView {
    
    objc_setAssociatedObject(self, maskViewKey, maskView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (WindowTapBlock)windowTapBlock {
    
    return objc_getAssociatedObject(self, windowTapBlockKey);
}

- (void)setWindowTapBlock:(WindowTapBlock)windowTapBlock {
    
    objc_setAssociatedObject(self, windowTapBlockKey, windowTapBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addClearMaskView {
    
    if (!self.maskView) {
        
        self.maskView = [[UIView alloc] initWithFrame:self.bounds];
        self.maskView.backgroundColor = [UIColor blackColor];
        self.maskView.alpha = 0.5;
    }
    [self addSubview:self.maskView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.maskView addGestureRecognizer:tap];
}

- (void)removeClearMaskView {
    
    [self.maskView removeFromSuperview];
}
- (void)tapAction:(UIGestureRecognizer *)tap {

    self.windowTapBlock();
}

@end
