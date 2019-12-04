//  SubSettingPage.m
//  Demo
//  Created by 聚商码头 on 2019/12/3.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SubSettingPage.h"
#import "SubSettingCell.h"
#import "SubSettingCell2.h"
#import "SubSettingCell3.h"
@interface SubSettingPage ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
@implementation SubSettingPage
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"設定";
    [self setLeftButtonText:@"登出"];
    [self setRightButtonText:@"關閉本頁"];
    [self setupTableView];
}
-(void)onRightBtnAction:(UIButton *)button
{
   [self.navigationController popViewControllerAnimated:YES];
}
-(void)onLeftBtnAction:(UIButton *)button{

   [self.navigationController popViewControllerAnimated:YES];
}
-(void)setupTableView
{
   self.tableview.delegate = self;
   self.tableview.dataSource = self;
   self.tableview.backgroundColor = [UIColor clearColor];
   self.tableview.showsHorizontalScrollIndicator = NO;
   self.tableview.showsVerticalScrollIndicator = NO;
   [self.tableview registerNib:[UINib nibWithNibName:@"SubSettingCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SubSettingCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"SubSettingCell2" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SubSettingCell2"];
   [self.tableview registerNib:[UINib nibWithNibName:@"SubSettingCell3" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SubSettingCell3"];
   [self setViewRefreshTableView:self.tableview withHeaderAction:@selector(actionNewData) andFooterAction:@selector(actionMoreData) target:self];
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
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return 3;
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
   if (indexPath.row == 0) {
      return 140;
   }else if(indexPath.row == 1){
      return 80;
   }else{
      return 80;
   }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.row == 0) {
      SubSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubSettingCell"];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      return cell;
   }else if(indexPath.row == 1 ){
      SubSettingCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"SubSettingCell2"];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      return cell;
   }else{
      SubSettingCell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"SubSettingCell3"];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      return cell;
   }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
