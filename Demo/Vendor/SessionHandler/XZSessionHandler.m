//  XZSessionHandler.m
//  YDXZ
//  Created by HJR on 2018/8/14.
//  Copyright © 2018年 niecong. All rights reserved.
#import "XZSessionHandler.h"
//#import "LoginPage.h"

@implementation XZSessionHandler

+ (BOOL)needLogin:(NSDictionary *)response
{
    if(![response isKindOfClass:[NSDictionary class]])
    {
        return NO;
    }
    NSInteger code = [[response objectForKey:@"code"]  integerValue];
    NSInteger error = [[response objectForKey:@"error"]  integerValue];
    if (code == 401 && error)
    {
        return YES;
    }
    
    return NO;
}

+ (void)loginIfNeeded:(NSDictionary *)response
{
    if(![response isKindOfClass:[NSDictionary class]])
    {
        return;
    }
    NSInteger code = [[response objectForKey:@"code"]  integerValue];
    NSInteger error = [[response objectForKey:@"error"]  integerValue];
    if (code == 401 && error)
    {
//        LoginViewController *loginvc = [[LoginViewController alloc]init];
//        UIViewController *VC = [self GetTopViewController];
//        
//        BOOL isPush;
//        if (VC.navigationController) {
//            isPush = YES;
//            [VC.navigationController pushViewController:loginvc animated:YES];
//        }
//        else {
//            isPush = YES;
//            [VC presentViewController:loginvc animated:YES completion:nil];
//        }
//        
//        __weak UIViewController *weakLoginVC  = loginvc;
//        loginvc.loginCallback = ^(BOOL success) {
//            if (success) {
//                if (isPush) {
//                    [VC.navigationController popViewControllerAnimated:YES];
//                }
//                else {
//                    [weakLoginVC dismissViewControllerAnimated:YES completion:nil];
//                }
//            }
//        };
//        
//        loginvc.loginFailureCallback = ^(YTKBaseRequest *request) {
//           // [weakLoginVC dismissViewControllerAnimated:YES completion:nil];
//        };
    }
}

//+ (UIViewController *)GetTopViewController
//{
//    UIViewController *vc = [self topViewController];
//    return vc;
//}
//
//#pragma mark - pravite
//+ (UIViewController *)topViewController {
//    UIViewController *resultVC;
//    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
//    while (resultVC.presentedViewController) {
//        resultVC = [self _topViewController:resultVC.presentedViewController];
//    }
//    return resultVC;
//}
//
//+ (UIViewController *)_topViewController:(UIViewController *)vc {
//    if ([vc isKindOfClass:[UINavigationController class]]) {
//        return [self _topViewController:[(UINavigationController *)vc topViewController]];
//    } else if ([vc isKindOfClass:[UITabBarController class]]) {
//        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
//    } else {
//        return vc;
//    }
//    return nil;
//}


@end
