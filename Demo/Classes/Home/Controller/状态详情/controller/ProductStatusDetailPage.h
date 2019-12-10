//
//  ProductStatusDetailPage.h
//  Demo
//
//  Created by 聚商码头 on 2019/12/10.
//  Copyright © 2019 zhufeng. All rights reserved.

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductStatusDetailPage : BaseViewController

//0:已支付 1:为支付 2:未售 3:已售
@property (nonatomic,assign)int status;

@end

NS_ASSUME_NONNULL_END
