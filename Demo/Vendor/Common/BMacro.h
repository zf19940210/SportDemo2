//  BMacro.h
//  Bclient
//  Created by niecong on 2018/3/27.
//  Copyright © 2018年 niecong. All rights reserved.
#ifndef BMacro_h
#define BMacro_h
//baseUrl
#define ZP_BASE_URL @"https://employ.oss-cn-beijing.aliyuncs.com/common/"
#define kWindow [UIApplication sharedApplication].delegate.window
//弱引用
#define WEAKSELF __weak typeof(self) weakSelf = self;
//判断设备
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) // 判断是否是IOS6的系统
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) // 判断是否是IOS7的系统
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 9.0) // 判断是否是IOS8的系统
#define IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 10.0) // 判断是否是IOS9的系统
#define IOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 11.0) // 判断是否是IOS10的系统
#define IOS11 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 12.0) // 判断是否是IOS11的系统
//动态获取设备高度
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IPHONE_WIDTH [UIScreen mainScreen].bounds.size.width
//设置颜色
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//设置颜色与透明度
#define HEXCOLORAL(rgbValue, al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]
//颜色
#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]
#define RGBA(A,B,C,D) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:D]
//判断字符串为空
#define IS_EMPTY(str) (str == nil || str == NULL || [str length] == 0 )
#define Gold1Color HEXCOLOR(0x905f3a)
#define Gold2Color HEXCOLOR(0xc4a486)
#define Line1Color HEXCOLOR(0xd7d5d6)
#define Line2Color HEXCOLOR(0xe5e5e5)
#define BlackColor HEXCOLOR(0x111111)
#define ZFBlcokColor HEXCOLOR(0x111112)
#define BGCOLOR HEXCOLOR(0xF76048)
#define ButtonColor HEXCOLOR(0xb7997e)
#define GrayFontColor HEXCOLOR(0xbbbbbb)
#define DarkGrayFontColor HEXCOLOR(0x888888)
#define GreenFontColor HEXCOLOR(0x19b8b0)
#define BlackFontColor HEXCOLOR(0x333333)
#define RedFontColor HEXCOLOR(0xb4282d)
#define MainThemColor  HEXCOLOR(0x5A74BB)
#define ZFColor HEXCOLOR(0x383533)
#define RootNavVC (UINavigationController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController]

#define SharedAppDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//iPhoneX系列
#define Height_X2 ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 54.0 : 0)
#define Height_X ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 34.0 : 0)
#define Height_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define Height_NavBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)

#define FailRequestTip @"服务器繁忙"

//通知类型的key   === ZF 7月5日
#define ISNotFirst       @"isNotFirstRun"
//发布圈
#define NotificationSendCircleNoti  @"NotificationSendCircleNoti"
//更新购物车的角标
#define NotificationCarNumberNoti  @"NotificationCarNumberNoti"
//退出登录
#define NotificationLogoutNoti  @"NotificationLogoutNoti"
//商品编辑的删除的通知
#define NotificationEditNoti  @"NotificationEditNoti"

#endif /* BMacro_h */
