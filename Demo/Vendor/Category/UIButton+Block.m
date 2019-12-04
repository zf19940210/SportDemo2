//
//  UIButton+Block.m
//  iOS常见控件的安装
//
//  Created by 张建 on 16/10/17.
//  Copyright © 2016年 张建. All rights reserved.
#import "UIButton+Block.h"
#import <objc/runtime.h>
@implementation UIButton (Block)
static NSString *keyOfUseCategoryMethod;//用分类方法创建的button，关联对象的key
static NSString *keyOfBlock;

+ (UIButton *)creatBtnWithFrame:(CGRect)frame btnTitle:(NSString *)titleString btnTitleColor:(UIColor *)color btnTitleFont:(NSInteger)font btnTagPrice:(NSInteger )btnTag btnSetImage:(UIImage *)image btnBackgroundColor:(UIColor *)BGcolor   isCorner:(BOOL)corner action:(tapActionBlock)actionBlock
{
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.tag = btnTag;
    [button setTitle:titleString forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    if (font != 0) {
       button.titleLabel.font = [UIFont systemFontOfSize:14];
    }
   
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = BGcolor;
//    [button setBackgroundImage:backgrImage forState:UIControlStateNormal];
    if (corner) {
        button.layer.cornerRadius = frame.size.height/2;
        button.clipsToBounds = YES;
    }
    [button addTarget:button action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *用runtime中的函数通过key关联对象
     *
     *objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
     *id object                     表示关联者，是一个对象，变量名理所当然也是object
     *const void *key               获取被关联者的索引key
     *id value                      被关联者，这里是一个block
     *objc_AssociationPolicy policy 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
     
     */
    objc_setAssociatedObject (button , &keyOfUseCategoryMethod , actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
    
    NSLog(@"associatedObject:%@", button);

    return button;
}
- (void)tapAction:(UIButton*)sender
{
    /**
     * 通过key获取被关联对象
     *objc_getAssociatedObject(id object, const void *key)
     *
     */
    tapActionBlock block = ( tapActionBlock )objc_getAssociatedObject (sender , &keyOfUseCategoryMethod );
    
    if (block) {
        
        block(sender);
        
    }
}



- (void)setActionBlock:(tapActionBlock)actionBlock
{
    objc_setAssociatedObject (self , &keyOfBlock , actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
    
}

- (tapActionBlock)actionBlock
{
    return objc_getAssociatedObject (self , &keyOfBlock );
}
+ (UIButton *)creatBtnWithFrame:(CGRect)frame btnTitle:(NSString *)titleString btnTitleColor:(UIColor *)color btnTitleFont:(int)font btnSetImage:(UIImage *)image btnBackgroundColor:(UIColor *)BGcolor backgroundImage:(UIImage *)backgrImage  isCorner:(BOOL)corner action:(tapActionBlock)actionBlock
{
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:titleString forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    if (font != 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:font];
    }
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = BGcolor;
    [button setBackgroundImage:backgrImage forState:UIControlStateNormal];
    if (corner) {
        button.layer.cornerRadius = frame.size.height/2;;
        button.clipsToBounds = YES;
    }
    [button addTarget:button action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *用runtime中的函数通过key关联对象
     *
     *objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
     *id object                     表示关联者，是一个对象，变量名理所当然也是object
     *const void *key               获取被关联者的索引key
     *id value                      被关联者，这里是一个block
     *objc_AssociationPolicy policy 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
     
     */
    objc_setAssociatedObject (button , &keyOfUseCategoryMethod , actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
    
    return button;
}



@end
