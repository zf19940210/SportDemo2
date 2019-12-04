//  UIWindow+Category.m
//  JDJOB
//  Created by 聚商码头 on 2019/7/7.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "UIWindow+Category.h"
#import <objc/runtime.h>
/**
 *  利用运行时的动态绑定, 伪实现类目添加属性的效果
 */
static char const * const maskViewKey = "maskView";
static char const * const windowTapBlockKey = "windowTapBlock";
@implementation UIWindow (Category)
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
