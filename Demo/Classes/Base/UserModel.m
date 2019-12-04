//  UserModel.m
//  AHMaster
//  Created by hwkj on 2019/5/16.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "UserModel.h"
static NSString *UserModelKey = @"UserModelkey";
@implementation UserModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"userId": @"id"};
}

+ (void)save:(UserModel *)model{
    NSDictionary *user = model.mj_keyValues;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:user forKey:UserModelKey];
    [defaults synchronize];
}
+ (UserModel *)getInfo{
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:UserModelKey];
    UserModel *user =[UserModel mj_objectWithKeyValues:dict];
    return user;
}
+ (BOOL)isOnline{
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:UserModelKey];
    UserModel *user =[UserModel mj_objectWithKeyValues:dict];
    if (user.phone.length>0)
        return YES;
    return NO;
}
+ (void)logout{
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:UserModelKey];
    UserModel *user =[UserModel mj_objectWithKeyValues:dict];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:UserModelKey];
    [defaults synchronize];
    user = nil;
}
@end
