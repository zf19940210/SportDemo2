//  SaleProductPage.m
//  Demo
//  Created by 聚商码头 on 2019/12/2.
//  Copyright © 2019 zhufeng. All rights reserved.
#import "SaleProductPage.h"
#import "SaleProductCell.h"
@interface SaleProductPage ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *allArr;
@end
@implementation SaleProductPage
-(NSMutableArray *)allArr
{
   if (!_allArr) {
      _allArr = [NSMutableArray array];
   }
   return _allArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"銷售的產品";
    [self setupTableView];
}
-(void)setupTableView
{
   self.tableview.delegate = self;
   self.tableview.dataSource = self;
   self.tableview.backgroundColor = [UIColor clearColor];
   self.tableview.showsHorizontalScrollIndicator = NO;
   self.tableview.showsVerticalScrollIndicator = NO;
   [self.tableview registerNib:[UINib nibWithNibName:@"SaleProductCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SaleProductCell"];
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
   return self.allArr.count;
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
   return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   SaleProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SaleProductCell"];
   cell.selectionStyle = UITableViewCellSelectionStyleNone;
   return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
