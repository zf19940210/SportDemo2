//  HomeMainPage.m
//  Demo
//  Created by 聚商码头 on 2019/11/30.
//  Copyright © 2019 zhufeng. All rights reserved.
//
#import "HomeMainPage.h"
#import "HomeTitleCell.h"
#import "HomeHeaderCell.h"
#import "HomeSingleScrollCell.h"
#import "HomeAllScrollCell.h"
@interface HomeMainPage ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *imageArr;
@end
@implementation HomeMainPage
-(void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
   self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
-(NSMutableArray *)imageArr
{
   if (!_imageArr) {
      _imageArr = [NSMutableArray arrayWithObjects:@"28210202_01",@"28210202_02", nil];
   }
   return _imageArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor whiteColor];
   self.navigationItem.title = @"商品列表";
   [self setupTableView];
}
-(void)setupTableView
{
   self.tableview.delegate = self;
   self.tableview.dataSource = self;
   self.tableview.backgroundColor = [UIColor clearColor];
   self.tableview.showsHorizontalScrollIndicator = NO;
   self.tableview.showsVerticalScrollIndicator = NO;
   [self.tableview registerNib:[UINib nibWithNibName:@"HomeHeaderCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HomeHeaderCell"];
   [self.tableview registerNib:[UINib nibWithNibName:@"HomeTitleCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HomeTitleCell"];
   [self.tableview registerClass:[HomeSingleScrollCell class] forCellReuseIdentifier:@"HomeSingleScrollCell"];
   [self.tableview registerClass:[HomeAllScrollCell class] forCellReuseIdentifier:@"HomeAllScrollCell"];
}
#pragma mark -- uitableviewdlegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if (section == 0) {
      return 1;
   }else{
      return 2;
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
        return 220;
    }else if (indexPath.section == 1) {
       if (indexPath.row == 0) {
          return 40;
       }else{
          return 100;
       }
    }else  {
       if (indexPath.row == 0) {
          return 40;
       }else{
          return 240;
       }
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
       HomeHeaderCell *headercell = [tableView dequeueReusableCellWithIdentifier:@"HomeHeaderCell"];
       headercell.selectionStyle = UITableViewCellSelectionStyleNone;
       headercell.imgArr = self.imageArr;
       headercell.paomadneg_lab.textColor = [UIColor blackColor];
       headercell.paomadneg_lab.font = [UIFont systemFontOfSize:15];
       [headercell.paomadneg_lab setTitle:@"最新上架球鞋 NIKE TWD 最新上架球鞋 NIKE TWD 最新上架球鞋 NIKE TWD" Animate:YES];
       return headercell;
    }else if (indexPath.section == 1){
       if (indexPath.row == 0) {
         HomeTitleCell *titlecell = [tableView dequeueReusableCellWithIdentifier:@"HomeTitleCell"];
         titlecell.selectionStyle = UITableViewCellSelectionStyleNone;
         titlecell.title_lab.text = @"一般球鞋";
          [titlecell setHomeTitleCellBlock:^{
             [self.tabBarController setSelectedIndex:1];
          }];
          return titlecell;
       }else{
          HomeSingleScrollCell *singleCell = [tableView dequeueReusableCellWithIdentifier:@"HomeSingleScrollCell"];
          singleCell.selectionStyle = UITableViewCellSelectionStyleNone;
          return singleCell;
       }
    }else{
       if (indexPath.row == 0) {
          HomeTitleCell *titlecell = [tableView dequeueReusableCellWithIdentifier:@"HomeTitleCell"];
          titlecell.selectionStyle = UITableViewCellSelectionStyleNone;
          titlecell.title_lab.text = @"特殊球鞋";
          [titlecell setHomeTitleCellBlock:^{
             [self.tabBarController setSelectedIndex:1];
          }];
           return titlecell;
       }else{
          HomeAllScrollCell *allcell = [tableView dequeueReusableCellWithIdentifier:@"HomeAllScrollCell"];
          allcell.selectionStyle = UITableViewCellSelectionStyleNone;
          return allcell;
       }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
