//  OutProductPage.m
//  Demo
//  Created by 聚商码头 on 2019/12/11.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "OutProductPage.h"
#import "BuyProductCell.h"
#import "ProductStatusDetailPage.h"
@interface OutProductPage () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end
@implementation OutProductPage
-(NSMutableArray *)dataArr
{
   if (!_dataArr) {
      _dataArr = [NSMutableArray array];
   }
   return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationItem.title = @"銷售的記錄";
   self.view.backgroundColor = [UIColor whiteColor];
   [self setLeftButton:[UIImage imageNamed:@"close"]];
   [self setupTableView];
}
-(void)onLeftBtnAction:(UIButton *)button
{
   [self.navigationController popViewControllerAnimated:YES];
}
-(void)setupTableView
{
   self.tableview.delegate = self;
   self.tableview.dataSource = self;
   self.tableview.backgroundColor = [UIColor clearColor];
   self.tableview.showsHorizontalScrollIndicator = NO;
   self.tableview.showsVerticalScrollIndicator = NO;
   [self.tableview registerNib:[UINib nibWithNibName:@"BuyProductCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BuyProductCell"];
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
   //self.allArr.count;
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
   return 90;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   BuyProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyProductCell"];
   cell.selectionStyle = UITableViewCellSelectionStyleNone;
   cell.icon_img.image = [UIImage imageNamed:@"1242-購買紀錄_08"];
   if (indexPath.row == 0 || indexPath.row == 1) {
      cell.status_lab.text = @"未售";
      cell.status_lab.textColor = [UIColor redColor];
      cell.left_layout.constant = 90.0f;
   }else{
      cell.status_lab.text = @"已售";
      cell.status_lab.textColor = RGB(59, 199, 89);
      cell.left_layout.constant = 0.0f;
   }
   return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
   if (indexPath.row == 0 || indexPath.row == 1) {
      ProductStatusDetailPage *detaivc = [[ProductStatusDetailPage alloc]init];
      detaivc.status = 2;
      [self.navigationController pushViewController:detaivc animated:YES];
   }else{
      ProductStatusDetailPage *detaivc = [[ProductStatusDetailPage alloc]init];
      detaivc.status = 3;
      [self.navigationController pushViewController:detaivc animated:YES];
   }
}
@end
