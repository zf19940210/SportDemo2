//  ResponseModel.h
//  AHMaster
//  Created by hwkj on 2019/5/16.
//  Copyright © 2019 zhufeng. All rights reserved.
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface ResponseModel : NSObject
@property (nonatomic,assign) NSInteger error;
@property (nonatomic,assign) NSInteger code;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,strong) id data;
@end
NS_ASSUME_NONNULL_END
