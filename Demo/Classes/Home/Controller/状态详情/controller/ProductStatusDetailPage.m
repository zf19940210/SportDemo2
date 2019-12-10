//  ProductStatusDetailPage.m
//  Demo
//  Created by 聚商码头 on 2019/12/10.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "ProductStatusDetailPage.h"
#import "DetailImgCell.h"
#import "DetailDesCell.h"
#import "ProductStatusCell.h"
#import "ProductStatusCell2.h"
#import "ProductPayCell.h"
#import "ProductEmptyCell.h"
#import "DetailContentCell.h"
@interface ProductStatusDetailPage () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *titleArr;
@property (nonatomic,strong)NSMutableArray *contentArr;
@end
@implementation ProductStatusDetailPage
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setDisplayCustomTitleText:@"Jordan 1 Retro High" subTitle:@"Shattered Backboard"];
   [self setupTablview];
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
-(void)setupTablview
{
   self.tableview.delegate = self;
   self.tableview.dataSource = self;
   self.tableview.backgroundColor = [UIColor clearColor];
   self.tableview.showsVerticalScrollIndicator = NO;
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailImgCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailImgCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"DetailDesCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailDesCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"ProductStatusCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ProductStatusCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"ProductStatusCell2" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ProductStatusCell2"];
   [self.tableview registerNib:[UINib nibWithNibName:@"ProductPayCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ProductPayCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"ProductEmptyCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ProductEmptyCell"];
   [self.tableview registerNib:[UINib nibWithData:@"DetailContentCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailContentCell"];
}

#pragma mark -- uitableviewdlegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 7;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if (section == 0) {
      return  1;
   }else if(section == 1){
      return 1;
   }else if(section == 2){
      return 1;
   }else if(section == 3){
      return  self.titleArr.count;
   }else if(section == 4){
      return 1;
   }else if(section == 5){
      if (self.status == 0) {
         return 1;
      }else if(self.status == 1){
         return 1;
      }else if(self.status == 2){
         return 1;
      }else if(self.status == 3){
         return 1;
      }else{
         return 1;
      }
   }else if(section == 6){
      if (self.status == 0) {
         return 1;
      }else if(self.status == 1){
         return 1;
      }else if(self.status == 2){
         return 1;
      }else if(self.status == 3){
         return 1;
      }else{
         return 1;
      }
   }else{
      return 0;
   }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
////0:已支付 1:为支付 2:未售 3:已售
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.section == 0) {
     return  IPHONE_WIDTH *0.6;
   }else if(indexPath.section == 1){
      return 120;
   }else if(indexPath.section == 2){
      return 40;
   }else if(indexPath.section == 3){
      return 40;
   }else if(indexPath.section == 4){
      return 40;
   }else if(indexPath.section == 5){
      if (self.status == 0) {
         return 0;
      }else if(self.status == 1){
         return 40;
      }else if(self.status == 2){
         return 40;
      }else if(self.status == 3){
         return 40;
      }else{
         return 0;
      }
   }else if(indexPath.section == 6){
      if (self.status == 0) {
         return 0;
      }else if(self.status == 1){
         return 0;
      }else if(self.status == 2){
         return 0;
      }else if(self.status == 3){
         return 40;
      }else{
         return 0;
      }
   }else{
      return 0;
   }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.section == 0) {
      DetailImgCell *imagcell = [tableView dequeueReusableCellWithIdentifier:@"DetailImgCell"];
      imagcell.selectionStyle =  UITableViewCellSelectionStyleNone;
      return imagcell;
   }else if(indexPath.section == 1){
      DetailDesCell *descell = [tableView dequeueReusableCellWithIdentifier:@"DetailDesCell"];
      descell.selectionStyle =  UITableViewCellSelectionStyleNone;
      return descell;
   }else if(indexPath.section == 2){
      ProductStatusCell *statuscell = [tableView dequeueReusableCellWithIdentifier:@"ProductStatusCell"];
      statuscell.selectionStyle = UITableViewCellSelectionStyleNone;
      return statuscell;
   }else if(indexPath.section == 3){
      DetailContentCell *detailcell = [tableView dequeueReusableCellWithIdentifier:@"DetailContentCell"];
      detailcell.selectionStyle = UITableViewCellSelectionStyleNone;
      return detailcell;
   }else if(indexPath.section == 4){
      ProductStatusCell *statuscell = [tableView dequeueReusableCellWithIdentifier:@"ProductStatusCell"];
           statuscell.selectionStyle = UITableViewCellSelectionStyleNone;
      return statuscell;
   }else if(indexPath.section == 5){
      if (self.status == 0) {
         ProductEmptyCell *emptycell = [tableView dequeueReusableCellWithIdentifier:@"ProductEmptyCell"];
         emptycell.selectionStyle = UITableViewCellSelectionStyleNone;
         return emptycell;
      }else if(self.status == 1){
         ProductPayCell *paycell = [tableView dequeueReusableCellWithIdentifier:@"ProductPayCell"];
         paycell.selectionStyle = UITableViewCellSelectionStyleNone;
         return paycell;
      }else if(self.status == 2){
         ProductStatusCell2 *statuscell = [tableView dequeueReusableCellWithIdentifier:@"ProductStatusCell2"];
         statuscell.selectionStyle = UITableViewCellSelectionStyleNone;
         return statuscell;
      }else if(self.status == 3){
         ProductStatusCell2 *statuscell = [tableView dequeueReusableCellWithIdentifier:@"ProductStatusCell2"];
         statuscell.selectionStyle = UITableViewCellSelectionStyleNone;
         return statuscell;
      }else{
         ProductEmptyCell *emptycell = [tableView dequeueReusableCellWithIdentifier:@"ProductEmptyCell"];
         emptycell.selectionStyle = UITableViewCellSelectionStyleNone;
      return emptycell;
      }
   }else if(indexPath.section == 6){
      if (self.status == 0) {
         ProductEmptyCell *emptycell = [tableView dequeueReusableCellWithIdentifier:@"ProductEmptyCell"];
         emptycell.selectionStyle = UITableViewCellSelectionStyleNone;
         return emptycell;
      }else if(self.status == 1){
         ProductEmptyCell *emptycell = [tableView dequeueReusableCellWithIdentifier:@"ProductEmptyCell"];
         emptycell.selectionStyle = UITableViewCellSelectionStyleNone;
         return emptycell;
      }else if(self.status == 2){
         ProductEmptyCell *emptycell = [tableView dequeueReusableCellWithIdentifier:@"ProductEmptyCell"];
         emptycell.selectionStyle = UITableViewCellSelectionStyleNone;
         return emptycell;
      }else if(self.status == 3){
         ProductStatusCell2 *statuscell = [tableView dequeueReusableCellWithIdentifier:@"ProductStatusCell2"];
         statuscell.selectionStyle = UITableViewCellSelectionStyleNone;
         return statuscell;
      }else{
         ProductEmptyCell *emptycell = [tableView dequeueReusableCellWithIdentifier:@"ProductEmptyCell"];
         emptycell.selectionStyle = UITableViewCellSelectionStyleNone;
         return emptycell;
      }
   }else{
      return nil;
   }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
