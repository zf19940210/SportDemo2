//  SizeAlterView.m
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SizeAlterView.h"
#import "SizeSelectCell.h"
@interface SizeAlterView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionview;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UILabel *left_lab;
@property (nonatomic,strong)UILabel *right_lab;
@end
@implementation SizeAlterView
-(UIView *)topView{
   if (!_topView) {
      _topView = [[UIView alloc]init];
      _topView.backgroundColor = [UIColor whiteColor];
   }
   return _topView;
}
-(UILabel *)left_lab
{
   if (!_left_lab) {
      _left_lab = [[UILabel alloc]init];
      _left_lab.text = @"選擇尺寸";
      _left_lab.textColor = [UIColor blackColor];
      _left_lab.font = [UIFont systemFontOfSize:16];
      _left_lab.textAlignment = NSTextAlignmentLeft;
   }
   return _left_lab;
}

-(UILabel *)right_lab
{
   if (!_right_lab) {
      _right_lab = [[UILabel alloc]init];
      _right_lab.text = @"尺寸列表";
      _right_lab.textColor = RGB(255, 149, 0);
      _right_lab.font = [UIFont systemFontOfSize:16];
      _right_lab.textAlignment = NSTextAlignmentLeft;
   }
   return _right_lab;
}

-(UICollectionView *)collectionview
{
   if (!_collectionview) {
      UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
      flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
      flowLayout.minimumLineSpacing = 0; //纵向间距
      flowLayout.minimumInteritemSpacing = 0; //横向间距
      _collectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
      _collectionview.backgroundColor = RGB(250, 250, 250);
      _collectionview.delegate = self;
      _collectionview.dataSource = self;
      [_collectionview registerNib:[UINib nibWithNibName:@"SizeSelectCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"SizeSelectCell"];
      _collectionview.showsHorizontalScrollIndicator = NO;
      _collectionview.showsVerticalScrollIndicator = NO;
   }
   return _collectionview;
}
-(instancetype)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
   if (self) {
      [self setupUI];
   }
   return self;
}

-(void)setupUI
{
   [self addSubview:self.topView];
   [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.left.right.mas_equalTo(self);
      make.height.offset(50);
   }];
   [self.topView addSubview:self.left_lab];
   [self.left_lab mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerY.mas_equalTo(self.topView);
      make.left.offset(10);
   }];
   [self.topView addSubview:self.right_lab];
   [self.right_lab mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerY.mas_equalTo(self.topView);
      make.right.offset(-10);
   }];

   [self addSubview:self.collectionview];
   [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.topView.mas_bottom).offset(0);
      make.left.right.bottom.mas_equalTo(self);
   }];
}
#pragma mark -- UICollectionViewDelegate || UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
   return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return 30;
}
//定义每个Section的四边间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   return  CGSizeMake((IPHONE_WIDTH-50)/4, (IPHONE_WIDTH-50)/4);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   SizeSelectCell *imgcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SizeSelectCell" forIndexPath:indexPath];
   imgcell.size_lab.text = [NSString stringWithFormat:@"%.1f",10.5+(int)indexPath.row*0.5];
   return imgcell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"indexpath:%ld",(long)indexPath.row);
}
@end
