//  SearchPage.m
//  Demo
//  Created by 聚商码头 on 2019/11/30.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SearchPage.h"
#import "SearchProductCell.h"
#import "ProductDetailPage.h"
@interface SearchPage ()<UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong)UICollectionView *collectionview;
@property (nonatomic,strong)UITextField *search_tf;
@property (nonatomic,strong)NSMutableArray *dataArray2;
@end
@implementation SearchPage
-(NSMutableArray *)dataArray2
{
   if (!_dataArray2) {
      _dataArray2 = [NSMutableArray arrayWithObjects:@"001",@"002",@"003",@"004",@"005",@"006",@"101",@"102",@"103",@"104",@"105",@"106", nil];
   }
   return _dataArray2;
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
      [_collectionview registerNib:[UINib nibWithNibName:@"SearchProductCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"SearchProductCell"];
      _collectionview.showsHorizontalScrollIndicator = NO;
      _collectionview.showsVerticalScrollIndicator = NO;
   }
   return _collectionview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNav];
    [self.view addSubview:self.collectionview];
     [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(0);
        make.trailing.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);
     }];
}
-(void)setupNav
{
   UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 30)];
   //textField.layer.masksToBounds = YES;
   //textField.layer.cornerRadius = textField.frame.size.height/2.0;
   textField.backgroundColor = [UIColor whiteColor];
   textField.font = [UIFont systemFontOfSize:14]; // 字体颜色
   NSMutableDictionary *attrs = [NSMutableDictionary dictionary]; // 创建属性字典
   attrs[NSFontAttributeName] = [UIFont systemFontOfSize:15]; // 设置font
   attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor]; // 设置颜色
   NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:@"搜尋品牌 顏色 等等關鍵字" attributes:attrs];
   textField.attributedPlaceholder = attStr;
   textField.textColor = [UIColor blackColor];
   textField.tintColor = [UIColor blackColor];
   //stextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 10)];// [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ksearch"]];
   textField.leftViewMode = UITextFieldViewModeAlways;
   textField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_delete"]];
   textField.rightView.userInteractionEnabled = YES;
   UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionClear:)];
   [textField.rightView addGestureRecognizer:tap];
   textField.rightViewMode = UITextFieldViewModeAlways;
   textField.rightView.hidden = YES;
   self.navigationItem.titleView = textField;
   textField.delegate = self;
   textField.returnKeyType = UIReturnKeySearch;
   textField.enablesReturnKeyAutomatically = YES; //这里设置为无文字就灰色不可点
   //监听的一个事件
   [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
   self.search_tf = textField;
   self.navigationItem.titleView = textField;
   [self setRightButton:[UIImage imageNamed:@"search_right"]];
   [self setLeftButton:[UIImage imageNamed:@"search_left"]];
}
/**
 编辑事件
 */
-(void)textFieldDidChange:(UITextField *)textField
{
    if (textField == self.search_tf) {
        if (textField.text.length == 0 ) {
            self.search_tf.rightView.hidden = YES;
            [self.dataArray removeAllObjects];
        }else{
            self.search_tf.rightView.hidden = NO;
        }
    }
}
-(void)onLeftBtnAction:(UIButton *)button
{

}
-(void)onRightBtnAction:(UIButton *)button
{
   [SVProgressHUD showInfoWithStatus:@"排序"];
}
#pragma mark -- UICollectionViewDelegate || UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
   return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return self.dataArray2.count;
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
   return  CGSizeMake((IPHONE_WIDTH-30)/2, 220);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   SearchProductCell *imgcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchProductCell" forIndexPath:indexPath];
   imgcell.bg_img.image = [UIImage imageNamed:self.dataArray2[indexPath.row]];
   return imgcell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   ProductDetailPage *detailvc = [[ProductDetailPage alloc]init];
   detailvc.productStr = @"Jordan 1 Retro High";
   detailvc.hidesBottomBarWhenPushed = YES;
   [self.navigationController pushViewController:detailvc animated:YES];
}
@end
