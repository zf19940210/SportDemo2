//  ProductTopView.m
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "ProductTopView.h"
#import "UIButton+Block.h"
@implementation ProductTopView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       self.backgroundColor = [UIColor whiteColor];
       UIView *bg_view = [[UIView alloc]init];
       bg_view.backgroundColor = RGB(230, 230, 230);
       bg_view.layer.cornerRadius = 8.0f;
       bg_view.layer.masksToBounds = YES;
       [self addSubview:bg_view];
       [bg_view mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerX.centerY.mas_equalTo(self);
          make.left.offset(30);
          make.right.offset(-30);
          make.height.offset(40);
       }];
        //尺寸
        _but1 = [UIButton creatBtnWithFrame:CGRectZero
                                   btnTitle:(@"求賣")
                              btnTitleColor:[UIColor blackColor] btnTitleFont:14
                                btnTagPrice:0
                                btnSetImage:nil
                         btnBackgroundColor:[UIColor clearColor]
                                   isCorner:NO
                                     action:^(UIButton *button) {
                button.selected = !button.selected;
                if (button.selected) {
                   _but2.selected = NO;
                   _but3.selected = NO;
                   _but2.backgroundColor = [UIColor clearColor];
                   _but3.backgroundColor = [UIColor clearColor];
                   _but1.backgroundColor = [UIColor lightGrayColor];
                   _but1.layer.cornerRadius = 8.0f;
                   _but1.layer.masksToBounds = YES;
                }
                else{
                    button.selected = YES;
                }
            }];
        [bg_view addSubview:_but1];
        _but1.backgroundColor = [UIColor lightGrayColor];
        _but1.selected = YES;
       _but1.layer.cornerRadius = 8.0f;
       _but1.layer.masksToBounds = YES;
       [_but1 mas_makeConstraints:^(MASConstraintMaker *make) {
          make.width.offset((IPHONE_WIDTH - 60)/3);
          make.centerY.mas_equalTo(bg_view);
          make.left.offset(0);
          make.height.offset(30);
       }];
       
      //求购价格
       _but2 = [UIButton creatBtnWithFrame:CGRectZero
                                  btnTitle:(@"求售")
                             btnTitleColor:[UIColor blackColor] btnTitleFont:14
                               btnTagPrice:0
                               btnSetImage:nil
                        btnBackgroundColor:[UIColor clearColor]
                                  isCorner:NO
                                    action:^(UIButton *button) {
               button.selected = !button.selected;
               if (button.selected) {
                  _but1.selected = NO;
                  _but3.selected = NO;
                  _but1.backgroundColor = [UIColor clearColor];
                  _but3.backgroundColor = [UIColor clearColor];
                  _but2.backgroundColor = [UIColor lightGrayColor];
                  _but2.layer.cornerRadius = 8.0f;
                  _but2.layer.masksToBounds = YES;
               }
               else{
                   button.selected = YES;
               }
           }];
       [bg_view addSubview:_but2];

       [_but2 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.mas_equalTo(_but1.mas_right).offset(0);
         make.width.offset((IPHONE_WIDTH-60)/3);
         make.centerY.mas_equalTo(bg_view);
         make.height.offset(30);
      }];
      //数量
      _but3 = [UIButton creatBtnWithFrame:CGRectZero
                                   btnTitle:(@"競價")
                              btnTitleColor:[UIColor blackColor] btnTitleFont:14
                                btnTagPrice:0
                                btnSetImage:nil
                         btnBackgroundColor:[UIColor clearColor]
                                   isCorner:NO
                                     action:^(UIButton *button) {
                button.selected = !button.selected;
                if (button.selected) {
                   _but1.selected = NO;
                   _but2.selected = NO;
                   _but1.backgroundColor = [UIColor clearColor];
                   _but2.backgroundColor = [UIColor clearColor];
                   _but3.backgroundColor = [UIColor lightGrayColor];
                   _but3.layer.cornerRadius = 8.0f;
                   _but3.layer.masksToBounds = YES;
                }
                else{
                    button.selected = YES;
                }
            }];
        [bg_view addSubview:_but3];

        [_but3 mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.mas_equalTo(_but2.mas_right).offset(0);
          make.width.offset((IPHONE_WIDTH-60)/3);
          make.centerY.mas_equalTo(bg_view);
          make.height.offset(30);
       }];
    }
    return self;
}
@end
