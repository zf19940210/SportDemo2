//  NSString+URL.h
//  AHMaster
//  Created by zhufeng on 2019/6/13.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URL)

/**
 *  URLEncode
 */
- (NSString *)URLEncodedString;

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString;

@end

NS_ASSUME_NONNULL_END
