//  SettingMainPage.m
//  Demo
//  Created by 聚商码头 on 2019/11/30.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SettingMainPage.h"
#import "SettingCell.h"
#import "SettingHeaderCell.h"
#import "ProductPage.h"
#import "SaleProductPage.h"
#import "FarvitonPage.h"
#import "UserMehthodPage.h"
#import "IntroductePage.h"
#import "MoneyPage.h"
#import "SubSettingPage.h"
@interface SettingMainPage ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)NSMutableArray *imageArray;
@end
@implementation SettingMainPage
-(NSMutableArray *)titleArray
{
   if (!_titleArray) {
      _titleArray = [NSMutableArray arrayWithObjects:@"購買的商品",@"銷售的產品",@"我的最愛",@"使用方法說明",@"使用說明",@"幣別:台幣", nil];
   }
   return _titleArray;
}
-(NSMutableArray *)imageArray
{
   if (!_imageArray) {
      _imageArray = [NSMutableArray arrayWithObjects:@"19_07",@"19_10",@"19_12",@"19_14",@"19_16",@"19_18", nil];
   }
   return _imageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的帳戶";
    [self setRightButton:[UIImage imageNamed:@"19_0311"]];
    [self setupTableView];
}
-(void)onRightBtnAction:(UIButton *)button
{
   SubSettingPage *subsettingvc = [[SubSettingPage alloc]init];
   subsettingvc.hidesBottomBarWhenPushed = YES;
   [self.navigationController pushViewController:subsettingvc animated:YES];
}
-(void)setupTableView
{
   self.tableview.delegate = self;
   self.tableview.dataSource = self;
   self.tableview.backgroundColor = [UIColor clearColor];
   self.tableview.showsHorizontalScrollIndicator = NO;
   self.tableview.showsVerticalScrollIndicator = NO;
   [self.tableview registerNib:[UINib nibWithNibName:@"SettingCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SettingCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"SettingHeaderCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SettingHeaderCell"];
}
#pragma mark -- uitableviewdlegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if (section == 0) {
      return 1;
   }else{
      return self.titleArray.count;
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
      return 90;
   }else{
      return 80;
   }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.section == 0) {
      SettingHeaderCell *headercell = [tableView dequeueReusableCellWithIdentifier:@"SettingHeaderCell"];
      headercell.selectionStyle = UITableViewCellSelectionStyleNone;
      return headercell;
   }else{
      SettingCell *headercell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
      headercell.selectionStyle = UITableViewCellSelectionStyleNone;
      headercell.bg_img.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
      headercell.title_lab.text = self.titleArray[indexPath.row];
      return headercell;
   }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   if (indexPath.section == 1) {
      int tag = (int)indexPath.row;
      switch (tag) {
         case 0:
         {
            ProductPage *productvc = [[ProductPage alloc]init];
            productvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:productvc animated:YES];
         }
            break;
         case 1:
         {
            SaleProductPage *salevc = [[SaleProductPage alloc]init];
            salevc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:salevc animated:YES];
         }
            break;
         case 2:
         {
            FarvitonPage *farvitonvc = [[FarvitonPage alloc]init];
            farvitonvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:farvitonvc animated:YES];
         }
            break;
         case 3:
         {
            UserMehthodPage *usermethodvc = [[UserMehthodPage alloc]init];
            usermethodvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:usermethodvc animated:YES];
         }
            break;
         case 4:
         {
            IntroductePage *introductvc = [[IntroductePage alloc]init];
            introductvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:introductvc animated:YES];
         }
            break;
         case 5:
         {
            MoneyPage *moneyvc = [[MoneyPage alloc]init];
            moneyvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:moneyvc animated:YES];
         }
            break;
         default:
            break;
      }
   }
}
@end
