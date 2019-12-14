//  MainTabbarVC.m
//  TestDemo2
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "MainTabbarVC.h"
#import "HomeMainPage.h"
#import "SettingMainPage.h"
#import "SearchPage.h"
@interface MainTabbarVC ()
@end
@implementation MainTabbarVC
+(void)initialize{
    [super initialize];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //防止抖动
    [[UITabBar appearance] setTranslucent:NO];
    [self setupAllChildController];
}
-(void)setupAllChildController
{
    HomeMainPage *homevc = [[HomeMainPage alloc]init];
    [self addChildViewConroller:homevc title:@"" norimage:@"首頁1.png" selectImage:@"首頁.png"];
    SearchPage *saearchvc = [[SearchPage alloc]init];
     [self addChildViewConroller:saearchvc title:@"" norimage:@"搜索2.png" selectImage:@"搜索.png"];
    SettingMainPage *settingvc = [[SettingMainPage alloc]init];
    [self addChildViewConroller:settingvc title:@"" norimage:@"個人中心.png" selectImage:@"個人中心 1.png"];
}
#pragma mark --初始化子控制器的属性
-(void)addChildViewConroller:(UIViewController *)chid
                       title:(NSString *)title
                    norimage:(NSString *)norImage
                 selectImage:(NSString *)selImgage{
    chid.title = title;
    UIImage *nor = [UIImage imageNamed:norImage];
    chid.tabBarItem.image = [nor imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *sel = [UIImage imageNamed:selImgage];
    chid.tabBarItem.selectedImage = [sel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   chid.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 5, -5, -5);
    //添加导航栏
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:chid];
    //添加子控制器
    [self addChildViewController:nav];
}
@end
