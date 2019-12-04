//  ZFNetworkTool.h
//  JDJOB
//  Created by zhufeng on 2019/7/28.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface ZFNetworkTool : NSObject <NSCopying>
+ (instancetype)sharedNetworkTool;
-(void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError * error))failure;
-(void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError * error))failure;
@end
NS_ASSUME_NONNULL_END
