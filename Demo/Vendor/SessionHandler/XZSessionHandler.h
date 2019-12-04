//
//  XZSessionHandler.h
//  YDXZ
//
//  Created by HJR on 2018/8/14.
//  Copyright © 2018年 niecong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZSessionHandler : NSObject

+ (BOOL)needLogin:(NSDictionary *)response;
+ (void)loginIfNeeded:(NSDictionary *)response;

@end
