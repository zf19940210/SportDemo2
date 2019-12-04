//  HomeSingleScrollCell.m
//  TestDemo2
//  Created by 聚商码头 on 2019/11/29.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "HomeSingleScrollCell.h"
#import "HomeSigleroductCell.h"
#import "ProductDetailPage.h"
@interface HomeSingleScrollCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionview;
@property (nonatomic,strong)NSMutableArray *dataArray2;
@end
@implementation HomeSingleScrollCell
-(NSMutableArray *)dataArray2
{
   if (!_dataArray2) {
      _dataArray2 = [NSMutableArray arrayWithObjects:@"101",@"102",@"103",@"104",@"105",@"106", nil];
   }
   return _dataArray2;
}
-(UICollectionView *)collectionview
{
   if (!_collectionview) {
      UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
      flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向
      flowLayout.minimumLineSpacing = 10; //纵向间距
      flowLayout.minimumInteritemSpacing = 10; //横向间距
      _collectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
      _collectionview.backgroundColor = [UIColor whiteColor];
      _collectionview.delegate = self;
      _collectionview.dataSource = self;
      [_collectionview registerNib:[UINib nibWithNibName:@"HomeSigleroductCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"HomeSigleroductCell"];
      _collectionview.showsHorizontalScrollIndicator = NO;
      _collectionview.showsVerticalScrollIndicator = NO;
   }
   return _collectionview;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
   if (self) {
      self.backgroundColor = [UIColor whiteColor];
      [self setupUI];
   }
   return self;
}

-(void)setupUI
{
   [self addSubview:self.collectionview];
   [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
      make.leading.offset(10);
      make.trailing.offset(-10);
      make.top.offset(10);
      make.bottom.offset(-10);
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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   return  CGSizeMake((IPHONE_WIDTH-20-25)/3, 80);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   HomeSigleroductCell *imgcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeSigleroductCell" forIndexPath:indexPath];
   imgcell.bg_img.image = [UIImage imageNamed:self.dataArray2[indexPath.row]];
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
