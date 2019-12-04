//  PriceAlterView.m
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "PriceAlterView.h"
#import "ProductTopView.h"
#import "ProductHeaderView.h"
#import "ProductAlterCell.h"
@interface PriceAlterView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)ProductTopView *topview;
@property (nonatomic,strong)ProductHeaderView *headerview;
@property (nonatomic,strong)UIButton *clse_btn;
@end
@implementation PriceAlterView
-(UIButton *)clse_btn
{
   if (!_clse_btn) {
      _clse_btn = [[UIButton alloc]init];
      [_clse_btn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
      [_clse_btn addTarget:self action:@selector(actionCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
   }
   return _clse_btn;
}
-(ProductHeaderView *)headerview
{
   if (!_headerview) {
      _headerview = [[ProductHeaderView alloc]init];
   }
   return _headerview;
}

-(ProductTopView *)topview{
    if (!_topview) {
       _topview = [[ProductTopView alloc] init];
    }
    return _topview;
}
-(UITableView *)tableview
{
   if (!_tableview) {
      _tableview = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
      _tableview.backgroundColor = [UIColor clearColor];
      _tableview.delegate = self;
      _tableview.dataSource = self;
      _tableview.showsVerticalScrollIndicator = NO;
      _tableview.showsHorizontalScrollIndicator =NO;
      [_tableview registerNib:[UINib nibWithNibName:@"ProductAlterCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ProductAlterCell"];
   }
   return _tableview;
}

- (instancetype)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
   if (self) {
      self.backgroundColor = [UIColor clearColor];
      [self setupUI];
   }
   return self;
}

-(void)actionCloseBtn:(UIButton *)btn
{
   if (self.shareViewBlock) {
      self.shareViewBlock();
   }
}

-(void)setupUI
{
   [self addSubview:self.clse_btn];
   [self.clse_btn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.offset(Height_StatusBar);
      make.right.offset(-10);
      make.width.height.offset(40);
   }];

   [self addSubview:self.topview];
   [self.topview mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.offset(0);
      make.right.offset(0);
      make.top.offset(Height_NavBar);
      make.height.offset(50);
   }];
   [self addSubview:self.headerview];
   [self.headerview mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.offset(0);
      make.right.offset(0);
      make.top.mas_equalTo(self.topview.mas_bottom).offset (0);
      make.height.offset(50);
   }];
   [self addSubview:self.tableview];
   [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.bottom.right.mas_equalTo(self);
      make.top.mas_equalTo(self.headerview.mas_bottom).offset(0);
   }];
}
#pragma mark -- uitableviewdlegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   ProductAlterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductAlterCell"];
   cell.selectionStyle = UITableViewCellSelectionStyleNone;
   return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
