//  ProductDetailPage.m
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "ProductDetailPage.h"
#import "DetailHeaderCell.h"
#import "DetailImgCell.h"
#import "DetailDesCell.h"
#import "DetailSameCell.h"
#import "DetailSameProudctCell.h"
#import "DetailGuigeCell.h"
#import "DetailSubGuigeCell.h"
#import "DetailContentCell.h"
#import "SizeAlterView.h"
#import "UIViewController+WYVCCategory.h"
#import "UIWindow+WYWindowCategory.h"
#import "PriceAlterView.h"
@interface ProductDetailPage ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *allArr;
@property (nonatomic,strong)NSMutableArray *imagArr;
@property (nonatomic,strong)NSMutableArray *titleArr;
@property (nonatomic,strong)NSMutableArray *contentArr;
@end
@implementation ProductDetailPage
-(NSMutableArray *)titleArr
{
   if (!_titleArr) {
      _titleArr = [NSMutableArray arrayWithObjects:@"型號",@"顏色種類",@"零售价",@"發行日期", nil];
   }
   return _titleArr;
}
-(NSMutableArray *)contentArr
{
   if (!_contentArr) {
      _contentArr = [NSMutableArray arrayWithObjects:@"CK555666-100",@"白色,黑色,紅色",@"TWD $ 2000",@"2001-05-20", nil];
   }
   return _contentArr;
}
-(NSMutableArray *)imagArr
{
   if (!_imagArr) {
      _imagArr = [NSMutableArray arrayWithObjects:@"detail_lunobo",@"detail_lunobo",@"detail_lunobo",@"detail_lunobo",@"detail_lunobo",nil];
   }
   return _imagArr;
}
- (void)viewDidLoad {
   [super viewDidLoad];
   self.view.backgroundColor = [UIColor whiteColor];
   //self.navigationItem.title = self.productStr;
   [self setDisplayCustomTitleText:@"Jordan 1 Retro High" subTitle:@"Shattered Backboard"];
   [self setupTableview];
}
#pragma mark - 设置导航栏 self.navigationItem.titleView 居中
- (void)setDisplayCustomTitleText:(NSString*)text subTitle:(NSString *)subTitle
{
    CGFloat titleViewHeight = 45;
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, titleViewHeight)];
    titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin;
    titleView.autoresizesSubviews = YES;
    titleView.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, titleViewHeight)];
    view.backgroundColor = [UIColor clearColor];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    CGRect leftViewbounds = self.navigationItem.leftBarButtonItem.customView.bounds;
    CGRect rightViewbounds = self.navigationItem.rightBarButtonItem.customView.bounds;
    CGRect frame;
    CGFloat maxWidth = leftViewbounds.size.width > rightViewbounds.size.width ? leftViewbounds.size.width : rightViewbounds.size.width;
    maxWidth += 15;//leftview 左右都有间隙，左边是5像素，右边是8像素，加2个像素的阀值 5 ＋ 8 ＋ 2
    frame = view.frame;
    frame.size.width = IPHONE_WIDTH - maxWidth * 2;

    view.frame = frame;
    frame = titleView.frame;
    frame.size.width = IPHONE_WIDTH - maxWidth * 2;
    titleView.frame = frame;
    [titleView addSubview:view];
   UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 25)];
   titleLabel.backgroundColor = [UIColor clearColor];
   titleLabel.font = [UIFont systemFontOfSize:18];
   titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
   titleLabel.textColor = [UIColor blackColor];
   titleLabel.textAlignment = NSTextAlignmentCenter;
   titleLabel.text = text;
   [view addSubview:titleLabel];
   UILabel *titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, frame.size.width, 20)];
   titleLabel2.backgroundColor = [UIColor clearColor];
   titleLabel2.font = [UIFont systemFontOfSize:14];
   titleLabel2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
   titleLabel2.textColor = [UIColor lightGrayColor];
   titleLabel2.textAlignment = NSTextAlignmentCenter;
   titleLabel2.text = subTitle;
   [view addSubview:titleLabel2];
   self.navigationItem.titleView = titleView;
}

-(void)setupTableview
{
   self.tableview.delegate = self;
   self.tableview.dataSource = self;
   self.tableview.backgroundColor = [UIColor clearColor];
   self.tableview.showsHorizontalScrollIndicator = NO;
   self.tableview.showsVerticalScrollIndicator = NO;
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailHeaderCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailHeaderCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailImgCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailImgCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailDesCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailDesCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailSameCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailSameCell"];
   [self.tableview registerClass:[DetailSameProudctCell class] forCellReuseIdentifier:@"DetailSameProudctCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailGuigeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailGuigeCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailSubGuigeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailSubGuigeCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailContentCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailContentCell"];
   //[self setViewRefreshTableView:self.tableview withHeaderAction:@selector(actionNewData) andFooterAction:@selector(actionMoreData) target:self];
}
-(void)actionNewData
{
}
-(void)actionMoreData
{
}
#pragma mark -- uitableviewdlegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if (section == 6) {
      return 4;
   }else if(section == 7){
      return self.titleArr.count;
   }else{
      return 1;
   }
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
   if (indexPath.section == 0) {
      return 120;
   }else if(indexPath.section == 1){
      return IPHONE_WIDTH *0.6;
   }else if(indexPath.section == 2){
      return 120;
   }else if(indexPath.section == 3){
      return 40;
   }else if(indexPath.section == 4) {
      return 120;
   }else if(indexPath.section == 5){
      return 40;
   }else if(indexPath.section == 6){
      return 40;
   }
   else{
      return 40;
   }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.section == 0) {
      DetailHeaderCell *heaadercll = [tableView dequeueReusableCellWithIdentifier:@"DetailHeaderCell"];
      heaadercll.selectionStyle = UITableViewCellSelectionStyleNone;
      [heaadercll setDetailHeaderCellSizeBlock:^{
         [self showSize];
      }];
      [heaadercll setDetailHeaderCellProductBlock:^{
         [self showPrice];
      }];
      return heaadercll;
   }else if(indexPath.section == 1){
      DetailImgCell *imgcell = [tableView dequeueReusableCellWithIdentifier:@"DetailImgCell"];
      imgcell.selectionStyle = UITableViewCellSelectionStyleNone;
      imgcell.imgArr = self.imagArr;
      return imgcell;
   }else if(indexPath.section == 2){
      DetailDesCell *descell = [tableView dequeueReusableCellWithIdentifier:@"DetailDesCell"];
      descell.selectionStyle = UITableViewCellSelectionStyleNone;
      return descell;
   }else if(indexPath.section == 3){
      DetailSameCell *samecell = [tableView dequeueReusableCellWithIdentifier:@"DetailSameCell"];
      samecell.selectionStyle = UITableViewCellSelectionStyleNone;
      return samecell;
   }else if(indexPath.section == 4){
      DetailSameProudctCell *sameproductcell = [tableView dequeueReusableCellWithIdentifier:@"DetailSameProudctCell"];
      sameproductcell.selectionStyle = UITableViewCellSelectionStyleNone;
      return sameproductcell;
   }else if(indexPath.section == 5){
      DetailGuigeCell *guigecell = [tableView dequeueReusableCellWithIdentifier:@"DetailGuigeCell"];
      guigecell.selectionStyle = UITableViewCellSelectionStyleNone;
      return guigecell;
   }else if(indexPath.section == 6){
      DetailSubGuigeCell *subcell = [tableView dequeueReusableCellWithIdentifier:@"DetailSubGuigeCell"];
      subcell.selectionStyle = UITableViewCellSelectionStyleNone;
      if (indexPath.row % 2 != 0) {
         subcell.backgroundColor = RGB(214, 214, 214);
      }else{
         subcell.backgroundColor = [UIColor whiteColor];
      }
      return subcell;
   }else{
      DetailContentCell *contentcell = [tableView dequeueReusableCellWithIdentifier:@"DetailContentCell"];
      contentcell.selectionStyle = UITableViewCellSelectionStyleNone;
      contentcell.title_lab.text = self.titleArr[indexPath.row];
      contentcell.content_lab.text = self.contentArr[indexPath.row];
      return contentcell;
   }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)showSize{
   [kWindow addClearMaskView];
   SizeAlterView *shareView = [[SizeAlterView alloc] init];
   [kWindow addSubview:shareView];
   [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.right.bottom.equalTo(kWindow);
       make.top.offset(110+Height_NavBar);
   }];
   CATransition* transition = [CATransition animation];
   transition.duration =0.4f;
   transition.type = kCATransitionMoveIn;
   transition.subtype = kCATransitionFromTop;
   [kWindow.layer addAnimation:transition forKey:kCATransition];
   kWindow.windowTapBlock = ^() {
       [kWindow removeClearMaskView];
       [UIView animateWithDuration:0.25 animations:^{
           shareView.transform = CGAffineTransformMakeScale(0.000001, 0.000001);
           [shareView.superview layoutIfNeeded];
       }];
   };
}
-(void)showPrice{
   [kWindow addClearMaskView];
   PriceAlterView *shareView = [[PriceAlterView alloc] init];
   [kWindow addSubview:shareView];
   [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.right.top.bottom.equalTo(kWindow);
   }];
   CATransition* transition = [CATransition animation];
   transition.duration =0.4f;
   transition.type = kCATransitionMoveIn;
   transition.subtype = kCATransitionFromLeft;
   [kWindow.layer addAnimation:transition forKey:kCATransition];
   kWindow.windowTapBlock = ^() {
       [kWindow removeClearMaskView];
       [UIView animateWithDuration:0.25 animations:^{
           shareView.transform = CGAffineTransformMakeScale(0.000001, 0.000001);
           [shareView.superview layoutIfNeeded];
       }];
   };
   __weak PriceAlterView *weakShareView = shareView;
   shareView.shareViewBlock = ^{
      [kWindow removeClearMaskView];
      [UIView animateWithDuration:0.25 animations:^{

          weakShareView.transform = CGAffineTransformMakeScale(0.000001, 0.000001);
          [weakShareView.superview layoutIfNeeded];
      }];
   };
}
@end
