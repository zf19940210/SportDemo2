//  AppDelegate.m
//  Demo
//  Created by 聚商码头 on 2019/11/30.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "AppDelegate.h"
#import "MainTabbarVC.h"
#import "LoginAndRegisterPage.h"
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    sleep(3);
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    BOOL isFist = [[NSUserDefaults standardUserDefaults]boolForKey:@"isFirst"];
    if (!isFist) {
       LoginAndRegisterPage *loginvc = [[LoginAndRegisterPage alloc]init];
       UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginvc];
       self.window.rootViewController = nav;
    }else{
      MainTabbarVC *tabbarvc = [[MainTabbarVC alloc]init];
      self.window.rootViewController = tabbarvc;
   }
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)actionThirdVendorConfigureWithOptions:(NSDictionary *)launchOptions
{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = @"http://jx.jingdezhaopin.top";
    // SVProgressHUD
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    //设置背景颜色
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    //设置前景色
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    //遮罩的颜色
    //[SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    //设置遮罩的颜色
    //[SVProgressHUD setBackgroundLayerColor:[UIColor yellowColor]];
    //动画的样式(菊花)|默认是圆圈
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    //显示时间
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];//显示的时间
    //键盘
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.keyboardDistanceFromTextField = 10;
    manager.enableAutoToolbar = YES;
    manager.toolbarDoneBarButtonItemText = @"确定";
}
- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationWillTerminate:(UIApplication *)application {
}
@end
