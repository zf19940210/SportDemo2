//  LoginAndRegisterPage.m
//  Demo
//  Created by 聚商码头 on 2019/12/16.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "LoginAndRegisterPage.h"
#import "MainTabbarVC.h"
#import "ForgetPwdPage.h"
@interface LoginAndRegisterPage ()
@property (weak, nonatomic) IBOutlet UILabel *register_lab;
@property (weak, nonatomic) IBOutlet UILabel *login_lab;
@property (weak, nonatomic) IBOutlet UIButton *register_btn;
@property (weak, nonatomic) IBOutlet UIButton *login_btn;
@property (weak, nonatomic) IBOutlet UIView *login_view;
@property (weak, nonatomic) IBOutlet UIView *register_view;
@property (weak, nonatomic) IBOutlet UITextField *login_name_tf;
@property (weak, nonatomic) IBOutlet UITextField *login_pwd_tf;
@property (weak, nonatomic) IBOutlet UITextField *register_phone_tf;
@property (weak, nonatomic) IBOutlet UITextField *register_code_tf;
@property (weak, nonatomic) IBOutlet UITextField *register_pwd_tf;
@property (weak, nonatomic) IBOutlet UITextField *register_pwd_again_tf;
@property (weak, nonatomic) IBOutlet UIButton *code_btn;
@end
@implementation LoginAndRegisterPage
-(BOOL)prefersStatusBarHidden{
    return NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
   [super viewDidLoad];
}
/// 选择注册
/// @param sender 选择注册
- (IBAction)actionRegistetBtn:(UIButton *)sender
{
   self.register_lab.backgroundColor = [UIColor blackColor];
   self.login_lab.backgroundColor = [UIColor lightGrayColor];
   [self.register_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   [self.login_btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
   self.register_view.hidden = NO;
   self.login_view.hidden = YES;
}
/// 选择登录
/// @param sender 登录
- (IBAction)actionLoginBtn:(UIButton *)sender
{
   self.register_lab.backgroundColor = [UIColor lightGrayColor];
   self.login_lab.backgroundColor = [UIColor blackColor];
   [self.register_btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
   [self.login_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   self.register_view.hidden = YES;
   self.login_view.hidden = NO;
}
/// 发送验证码
/// @param sender 发送验证码
- (IBAction)actionSendCodeBtn:(UIButton *)sender
{
   [SVProgressHUD showInfoWithStatus:@"发送验证码"];
}
/// 登录入口
/// @param sender 登录入口
- (IBAction)actionSelectLoginBtn:(UIButton *)sender
{
   [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isFirst"];
   [[NSUserDefaults standardUserDefaults]synchronize];
   MainTabbarVC *tabbarvc = [[MainTabbarVC alloc]init];
   [UIApplication sharedApplication].delegate.window.rootViewController = tabbarvc;
}
/// 注册入口
/// @param sender 注册入口
- (IBAction)actionSelectRegisterBtn:(UIButton *)sender
{
   [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isFirst"];
   [[NSUserDefaults standardUserDefaults]synchronize];
   MainTabbarVC *tabbarvc = [[MainTabbarVC alloc]init];
   [UIApplication sharedApplication].delegate.window.rootViewController = tabbarvc;
}
/// 忘记密码
/// @param sender 忘记密码
- (IBAction)actionForpwdBtn:(UIButton *)sender
{
   ForgetPwdPage *pwdvc = [[ForgetPwdPage alloc]init];
   [self.navigationController pushViewController:pwdvc animated:YES];
}
@end
