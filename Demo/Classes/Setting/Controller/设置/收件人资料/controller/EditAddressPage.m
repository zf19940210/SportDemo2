//  EditAddressPage.m
//  Demo
//  Created by 聚商码头 on 2019/12/4.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "EditAddressPage.h"
#import "EditHeaderCell.h"
#import "EditContentCell.h"
#import "EditSelectCell.h"
#import "EditSelectTimeCell.h"
@interface EditAddressPage ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)EditContentCell *contentcell1;
@property (nonatomic,strong)EditContentCell *contentcell2;
@property (nonatomic,strong)EditContentCell *contentcell3;
@property (nonatomic,strong)EditSelectCell *selectcell1;
@property (nonatomic,strong)EditSelectCell *selectcell2;
@property (nonatomic,strong)EditSelectTimeCell *selecttimecell;
@end
@implementation EditAddressPage
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"編輯收件人資料";
    [self setLeftButton:[UIImage imageNamed:@"1242-收件人_03"]];
    [self setupTaleview];
}
-(void)onLeftBtnAction:(UIButton *)button
{
   [self.navigationController popViewControllerAnimated:YES];
}
-(void)setupTaleview
{
   self.tableview.delegate = self;
   self.tableview.dataSource = self;
   self.tableview.backgroundColor = [UIColor clearColor];
   self.tableview.showsHorizontalScrollIndicator = NO;
   self.tableview.showsVerticalScrollIndicator = NO;
   [self.tableview registerNib:[UINib nibWithNibName:@"EditHeaderCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EditHeaderCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"EditContentCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EditContentCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"EditSelectCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EditSelectCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"EditSelectTimeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EditSelectTimeCell"];
}

#pragma mark -- uitableviewdlegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return 7;
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
      return 50;
   }else if(indexPath.row == 1){
      return 80;
   }else if(indexPath.row == 2){
      return 80;
   }else if(indexPath.row == 3){
      return 80;
   }else if(indexPath.row == 4){
      return 80;
   }else if(indexPath.row == 5){
      return 80;
   }else {
      return 90;
   }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.row == 0) {
      EditHeaderCell *headercell = [tableView dequeueReusableCellWithIdentifier:@"EditHeaderCell"];
      headercell.selectionStyle = UITableViewCellSelectionStyleNone;
      return headercell;
   }else if(indexPath.row == 1){
      self.contentcell1 = [tableView dequeueReusableCellWithIdentifier:@"EditContentCell"];
      self.contentcell1.selectionStyle = UITableViewCellSelectionStyleNone;
      self.contentcell1.title_lab.text = @"收件人姓名";
      return self.contentcell1;
   }else if(indexPath.row == 2){
      self.contentcell2 = [tableView dequeueReusableCellWithIdentifier:@"EditContentCell"];
      self.contentcell2 .selectionStyle = UITableViewCellSelectionStyleNone;
      self.contentcell2.title_lab.text = @"收件人電話";
      return self.contentcell2 ;
   }else if(indexPath.row == 3){
      self.selectcell1 = [tableView dequeueReusableCellWithIdentifier:@"EditSelectCell"];
      self.selectcell1.selectionStyle = UITableViewCellSelectionStyleNone;
      self.selectcell1.title_lab.text = @"縣市";
      self.selectcell1.content_tf.placeholder = @"下拉選擇縣市";
      return self.selectcell1;
   }else if(indexPath.row == 4){
      self.selectcell2 = [tableView dequeueReusableCellWithIdentifier:@"EditSelectCell"];
      self.selectcell2.selectionStyle = UITableViewCellSelectionStyleNone;
      self.selectcell2.title_lab.text = @"鄉鎮區";
      self.selectcell2.content_tf.placeholder = @"下拉選擇鄉鎮區";
      return self.selectcell2;
   }else if(indexPath.row == 5){
      self.contentcell3  = [tableView dequeueReusableCellWithIdentifier:@"EditContentCell"];
      self.contentcell3.selectionStyle = UITableViewCellSelectionStyleNone;
      self.contentcell3.title_lab.text = @"詳細地址";
      return self.contentcell3;
   }else {
      self.selecttimecell = [tableView dequeueReusableCellWithIdentifier:@"EditSelectTimeCell"];
      self.selecttimecell.selectionStyle = UITableViewCellSelectionStyleNone;
      return self.selecttimecell;
   }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/// 保存数据
/// @param sender 保存数据
- (IBAction)actionSaveBtn:(UIButton *)sender
{

}
@end
