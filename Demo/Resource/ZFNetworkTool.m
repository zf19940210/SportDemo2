//  ZFNetworkTool.m
//  JDJOB
//  Created by zhufeng on 2019/7/28.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "ZFNetworkTool.h"
@interface ZFNetworkTool()
@end
@implementation ZFNetworkTool
#pragma mark - 单例
static id _instance;
static AFHTTPSessionManager *_session;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)sharedNetworkTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _session = [AFHTTPSessionManager manager];
        _session.responseSerializer = [AFHTTPResponseSerializer serializer];
        _instance = [[self alloc] init];
        
    });
    return _instance;
}
- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}
-(void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    [_session GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            
            success(responseObject);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            
            failure(error);
            
        }
    }];
}

-(void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [_session POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            failure(error);
            
        }
    }];
}
@end
