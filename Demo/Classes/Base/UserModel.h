//  UserModel.h
//  AHMaster
//  Created by hwkj on 2019/5/16.
//  Copyright © 2019 zhufeng. All rights reserved
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
static NSString *NotificationUpdateUserInfo=@"NotificationUpdateUserInfo";
@interface UserModel : NSObject
@property (nonatomic , assign) NSInteger              userId;
@property (nonatomic , copy) NSString              * phone;
@property (nonatomic , copy) NSString              * password;
@property (nonatomic , copy) NSString              * unionid;
@property (nonatomic , copy) NSString              * headimgUrl;
@property (nonatomic , assign) NSInteger              parentId;
@property (nonatomic , copy) NSString              * createTime;
@property (nonatomic , copy) NSString              * updateTime;
@property (nonatomic , copy) NSString              * nickName;
@property (nonatomic , copy) NSString              * mySign;
@property (nonatomic , copy) NSString              * sex;
@property (nonatomic , assign) NSInteger            identification;
@property (nonatomic , copy) NSString              * cash;
@property (nonatomic , assign) NSInteger             roleId;
@property (nonatomic , copy)NSString               *address;
@property (nonatomic , copy)NSString               *workAddress;
@property (nonatomic , assign)NSInteger             workStatus;
@property (nonatomic , copy)NSString               *token;
@property (nonatomic , copy)NSString               *rongyunId;
+ (void)save:(UserModel *)model;
+ (UserModel *)getInfo;
+ (BOOL)isOnline;
+ (void)logout;
@end
NS_ASSUME_NONNULL_END
