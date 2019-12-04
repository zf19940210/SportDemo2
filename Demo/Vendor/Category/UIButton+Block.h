//
//  UIButton+Block.h
//  iOS常见控件的安装
//
//  Created by 张建 on 16/10/17.
//  Copyright © 2016年 张建. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^tapActionBlock)(UIButton *button);

@interface UIButton (Block)
@property(nonatomic,copy)tapActionBlock actionBlock;

/**
 通过block对button的点击事件封装
 
  frame       frame
  title       标题
 bgImageName 背景图片
  actionBlock 点击事件回调block
 
 @return button
 */
+ (UIButton *)creatBtnWithFrame:(CGRect)frame btnTitle:(NSString *)titleString btnTitleColor:(UIColor *)color btnTitleFont:(NSInteger)font btnTagPrice:(NSInteger )btnTag btnSetImage:(UIImage *)image btnBackgroundColor:(UIColor *)BGcolor   isCorner:(BOOL)corner action:(tapActionBlock)actionBlock;


/**
 通过block对button的点击事件封装//已废弃
 
 frame       frame
 title       标题
 bgImageName 背景图片
  actionBlock 点击事件回调block
 
 @return button
 */
+ (UIButton *)creatBtnWithFrame:(CGRect)frame btnTitle:(NSString *)titleString btnTitleColor:(UIColor *)color btnTitleFont:(int)font btnSetImage:(UIImage *)image btnBackgroundColor:(UIColor *)BGcolor backgroundImage:(UIImage *)backgrImage  isCorner:(BOOL)corner action:(tapActionBlock)actionBlock;


@end
