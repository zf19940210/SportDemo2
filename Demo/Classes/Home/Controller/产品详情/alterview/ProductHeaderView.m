//  ProductHeaderView.m
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "ProductHeaderView.h"
#import "UIButton+Block.h"
#import "UIButton+ImageTitleSpacing.h"
@implementation ProductHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //尺寸
        _but1 = [UIButton creatBtnWithFrame:CGRectZero btnTitle:@"尺碼"
                              btnTitleColor:[UIColor blackColor]
                               btnTitleFont:14
                                btnTagPrice:0
                                btnSetImage:[UIImage imageNamed:@"up"] btnBackgroundColor:[UIColor clearColor] isCorner:NO action:^(UIButton *button) {
                button.selected = !button.selected;
                //_but1.selected = NO;
                //_but3.selected = NO;
//                if (button.selected) {
//                    [_but2 setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
//                    [_but2 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
//
//                }
//                else{
//                    [_but2 setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
//                    [_but2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//                }
            }];
        [self addSubview:_but1];
        [_but1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self);
            make.width.offset(IPHONE_WIDTH/3);
        }];
        _but1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _but1.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
        [_but1 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:1];
      //成交量
      _but2 = [UIButton creatBtnWithFrame:CGRectZero btnTitle:@"價格" btnTitleColor:[UIColor blackColor] btnTitleFont:14 btnTagPrice:0 btnSetImage:[UIImage imageNamed:@"up"] btnBackgroundColor:[UIColor clearColor] isCorner:NO action:^(UIButton *button) {
              button.selected = !button.selected;
              _but1.selected = NO;
              _but3.selected = NO;
              if (button.selected) {
                  [_but2 setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
                  [_but2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

              }
              else{
                  [_but2 setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
                  [_but2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
              }
          }];
      [self addSubview:_but2];
      [_but2 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.mas_equalTo(_but1.mas_right).offset(0);
         make.top.bottom.mas_equalTo(self);
         make.width.offset(IPHONE_WIDTH/3);
      }];
      [_but2 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:1];
      //数量
      _but3 = [UIButton creatBtnWithFrame:CGRectZero
                                   btnTitle:(@"數量")
                              btnTitleColor:[UIColor blackColor] btnTitleFont:14
                                btnTagPrice:0
                                btnSetImage:nil
                         btnBackgroundColor:[UIColor clearColor]
                                   isCorner:NO
                                     action:^(UIButton *button) {
                button.selected = !button.selected;
                if (button.selected) {

                }
                else{
                    button.selected = YES;
                }
            }];
        [self addSubview:_but3];
       [_but3 mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.mas_equalTo(_but2.mas_right).offset(0);
          make.top.bottom.mas_equalTo(self);
          make.width.offset(IPHONE_WIDTH/3);
       }];
       _but3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
       _but3.contentEdgeInsets = UIEdgeInsetsMake(0,0, 0, 10);
    }
    return self;
}

@end
