//  HomeAllScrollCell.m
//  TestDemo2
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserve
#import "HomeAllScrollCell.h"
#import "HomePrductCell.h"
#import "ProductDetailPage.h"
@interface HomeAllScrollCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionview;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
@implementation HomeAllScrollCell
-(NSMutableArray *)dataArray
{
   if (!_dataArray) {
      _dataArray = [NSMutableArray arrayWithObjects:@"001",@"002",@"003",@"004",@"005",@"006", nil];
   }
   return _dataArray;
}
-(UICollectionView *)collectionview
{
   if (!_collectionview) {
      UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
      flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向
      flowLayout.minimumLineSpacing = 0; //纵向间距
      flowLayout.minimumInteritemSpacing = 0; //横向间距
      _collectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
      _collectionview.backgroundColor = RGB(250, 250, 250);
      _collectionview.delegate = self;
      _collectionview.dataSource = self;
      [_collectionview registerNib:[UINib nibWithNibName:@"HomePrductCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"HomePrductCell"];
      _collectionview.showsHorizontalScrollIndicator = NO;
      _collectionview.showsVerticalScrollIndicator = NO;
   }
   return _collectionview;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
   if (self) {
      [self setupUI];
   }
   return self;
}
-(void)setupUI
{
   [self addSubview:self.collectionview];
   [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
      make.leading.offset(0);
      make.trailing.offset(0);
      make.top.offset(0);
      make.bottom.offset(0);
   }];
}
#pragma mark -- UICollectionViewDelegate || UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
   return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return 6;
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
   return  CGSizeMake((IPHONE_WIDTH-20-25)/3, 220);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   HomePrductCell *imgcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePrductCell" forIndexPath:indexPath];
   imgcell.bg_img.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
   return imgcell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"indexpath:%ld",(long)indexPath.row);
   ProductDetailPage *detailvc = [[ProductDetailPage alloc]init];
   detailvc.productStr = @"Jordan 1 Retro High";
   detailvc.hidesBottomBarWhenPushed = YES;
   [self.viewController.navigationController pushViewController:detailvc animated:YES];
}
@end
