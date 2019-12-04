//
//  UIViewController+WYVCCategory.m
//  lmei
//
//  Created by Mac mini on 16/9/24.
//  Copyright © 2016年 Gaoxicee. All rights reserved.
//


#import "UIViewController+WYVCCategory.h"
#import <objc/runtime.h>
#define kTextColor kHEXCOLOR(0xFF6634)// App 主色调
/**
 *  利用运行时的动态绑定, 伪实现类目添加属性的效果
 */
static char const * const mbProgressHUDKey = "mbProgressHUD";
static char const * const maskViewKey = "maskView";

@implementation UIViewController (WYVCCategory)

@dynamic mbProgressHUD;
@dynamic maskView;

- (void)showMBProgressHUD {
    
    self.mbProgressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];// 添加到 view 上
    self.mbProgressHUD.contentColor = [UIColor whiteColor];// 指示器和文本的颜色
    self.mbProgressHUD.label.text = NSLocalizedString(@"请求中", @"HUD loading title");// 文本
    
//    self.jqIndicatorView = [[MBProgressHUD alloc] initWithType:2 tintColor:kMainColor size:CGSizeMake(80, 80)];
//    self.jqIndicatorView.center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2 - 64);
//    [self.view addSubview:self.jqIndicatorView];
//    [self.jqIndicatorView startAnimating];
}
-(void)showCode:(NSString *)string{

    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];

//    self.jqIndicatorView = [[JQIndicatorView alloc] initWithType:2 tintColor:kWhiteColor size:CGSizeMake(80, 80)];
//    self.jqIndicatorView.center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2 - 64);
    [self.view addSubview:self.imageV];

    [self.imageV sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:nil];
    //[self.jqIndicatorView startAnimating];

}
#pragma mark - 界面通用配置

- (void)vcCommenConfigurations {
    
    // 有导航栏和 tabBar 的情况下, 自动让布局从导航栏下边和 tabBar 上边开始布局
    if ([self performSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }


    // 保留滑动返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}


#pragma mark - MBProgressHUD

- (id)mbProgressHUD {
    
    return objc_getAssociatedObject(self, mbProgressHUDKey);
}

- (void)setMbProgressHUD:(MBProgressHUD *)mbProgressHUD {
    
    objc_setAssociatedObject(self, mbProgressHUDKey, mbProgressHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showMBProgressHUDWithText:(NSString *)text {
    
    self.mbProgressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];// 添加到 view 上
    self.mbProgressHUD.contentColor = [UIColor whiteColor];// 指示器和文本的颜色
    
    if (text.length == 0) {// 文本
    
        self.mbProgressHUD.label.text = @"请求中";
    }else {

        self.mbProgressHUD.label.text = text;
    }
}
- (void)hideMBProgressHUDAfterDelay:(float)delay {
    
    [self.mbProgressHUD hideAnimated:YES afterDelay:delay];
}

- (void)changeMBProgressHUDWithText:(NSString *)text {
    
    self.mbProgressHUD.label.text = text;
}


#pragma mark - maskView

- (id)maskView {
    
    return objc_getAssociatedObject(self, maskViewKey);
}

- (void)setMaskView:(UIView *)maskView {
    
    objc_setAssociatedObject(self, maskViewKey, maskView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addClearMaskView {
    
    if (!self.maskView) {
        
        self.maskView = [[UIView alloc] initWithFrame:self.view.bounds];
        self.maskView.backgroundColor =  [UIColor clearColor];
    }
    
    [self.view addSubview:self.maskView];
}

- (void)removeClearMaskView {
    
    [self.maskView removeFromSuperview];
}


#pragma mark - tabbar 的显示与隐藏

- (void)hideTabBar:(BOOL)hide {
    
    
    // tabBarController 有两个两个视图 : 一个是控制 view 当前显示的 view, 另一个就是 tabbar. 控制 tabbar 的隐藏与显示, 我们只需要操作 tabbar 的位置以及修改这个 view 的 frame 就可以了
    NSLog(@"%@", self.tabBarController.view);
    NSLog(@"%@", self.tabBarController.tabBar);
    
    UIView *tabBarControllerView = self.tabBarController.view;
    CGRect tabRect = self.tabBarController.tabBar.frame;
    
    if ([tabBarControllerView.subviews count] < 2) {
        
        return;
    }
    
    // 这里是获取到当前显示的 view
    UIView *view;
    if ([tabBarControllerView.subviews[0] isKindOfClass:[UITabBar class]]) {
        
        view = tabBarControllerView.subviews[1];
    }else {
        
        view = tabBarControllerView.subviews[0];
    }
    
    // 修改 view 的 frame
    if (hide) {// 隐藏 tabbar, 下移, 全屏
        
        tabRect.origin.y = [[UIScreen mainScreen] bounds].size.height + self.tabBarController.tabBar.frame.size.height;
        view.frame = tabBarControllerView.bounds;
    }else {// 显示 tabbar, 上移, 恢复
        
        tabRect.origin.y = [[UIScreen mainScreen] bounds].size.height - self.tabBarController.tabBar.frame.size.height;
        view.frame = CGRectMake(tabBarControllerView.bounds.origin.x, tabBarControllerView.bounds.origin.y, tabBarControllerView.bounds.size.width, tabBarControllerView.bounds.size.height);
    }
    
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        
        self.tabBarController.tabBar.frame = tabRect;
    }];
}

@end
