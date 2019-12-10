//  BaseViewController.m
//  YDXZ
//  Created by niecong on 2018/6/11.
//  Copyright © 2018年 niecong. All rights reserved.
#import "BaseViewController.h"
@interface BaseViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
{
    UIButton *_leftBackButton;
}
@end
@implementation BaseViewController
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentpage = 1;
    self.view.backgroundColor = [UIColor whiteColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {   self.edgesForExtendedLayout = UIRectEdgeNone;
        NSDictionary * attributes = @{
                                      NSForegroundColorAttributeName:[UIColor blackColor],
                                      NSFontAttributeName:[UIFont boldSystemFontOfSize:16]
                                      };
        [self.navigationController.navigationBar setTitleTextAttributes:attributes];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        // 设置状态栏覆盖
        [self.navigationController.navigationBar setTranslucent:NO];
        // shadowline
//        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
//        self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
        [self setNeedsStatusBarAppearanceUpdate];
    }
    [self setBackwardButton];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
//返回按钮
- (void)setBackwardButton{
    NSArray *viewControllers = [self.navigationController viewControllers];
    if (viewControllers.count > 1) {
        UIImage *image =[UIImage imageNamed:@"nav_left"];
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
        [leftBtn setImage:image forState:UIControlStateNormal];
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -27, 0, 8);
        _leftBackButton = leftBtn;
        [leftBtn addTarget:self action:@selector(onLeftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
      //  leftBtn.backgroundColor = [UIColor redColor];
    }
}
#pragma mark - getter
- (UIButton *)backButton
{
    return _leftBackButton;
}
#pragma mark - NavigationItem
- (void)setLeftButton:(UIImage *)image
{
    if (image) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBackButton = btn;
        [btn setImage:image forState:UIControlStateNormal];
        // button size
        btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0.0, 5.0, 0.0, -5.0);
        // button target
        [btn addTarget:self action:@selector(onLeftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        self.navigationItem.leftBarButtonItem = barItem;
    } else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc]init]];
    }
}
- (void)setLeftButtonText:(NSString *)text
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBackButton = btn;
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [btn setTitleColor:RGB(59, 199, 89) forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn sizeToFit];
    // button target
    [btn addTarget:self action:@selector(onLeftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barItem;
}
- (void)setRightButton:(UIImage *)image
{
    if (image) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:image forState:UIControlStateNormal];
        // button size
        btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0.0, 4.0, 0.0, -4.0);
        // button target
        [btn addTarget:self action:@selector(onRightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        self.navigationItem.rightBarButtonItem = barItem;
    }else {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc]init]];
    }
}

- (void)setRightButtonText:(NSString *)text
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [btn setTitleColor:RGB(59, 199, 89) forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, -4);
    // button target
    [btn addTarget:self action:@selector(onRightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barItem;
}
#pragma mark - Actions
- (void)onLeftBtnAction:(UIButton *)button
{   //这里保证下哈哈
    [SVProgressHUD dismiss];
    [self backViewController];
}
- (void)onRightBtnAction:(UIButton *)button
{
    
}
- (void)backViewController
{
    NSArray *viewControllers = [self.navigationController viewControllers];
    BOOL success = [[NSUserDefaults standardUserDefaults]boolForKey:@"test"];
    // 根据viewControllers的个数来判断此控制器是被present的还是被push的
    if (1 <= viewControllers.count && 0 < [viewControllers indexOfObject:self])
    {
        if (success == YES) {
            [self.navigationController popToRootViewControllerAnimated:YES];
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"test"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
// 拨打电话
- (void)callPhone:(NSString *)phoneStr
{
    if (phoneStr.length < 1)
    {
        [SVProgressHUD showInfoWithStatus:@"电话号码为空"];
        return;
    }
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneStr];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}
//分享的方法
-(void)shareMethod{
}
//刷新列表
- (void)setViewRefreshTableView:(UITableView *)tableView withHeaderAction:(SEL)hAction andFooterAction:(SEL)fAction target:(id)target
{
    // 设置header
    if (hAction) {
        tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:hAction];
    }
    //header.lastUpdatedTimeLabel.hidden = YES;
    if (fAction) {
        tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:fAction];
    }
    //设置空的数据
    [self setEmptyTableView:tableView];
}
- (void)setViewRefreshColletionView:(UICollectionView *)collectionView withHeaderAction:(SEL)hAction andFooterAction:(SEL)fAction target:(id)target{
    // 设置header
    if (hAction) {
        collectionView.mj_header= [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:hAction];
    }
    //header.lastUpdatedTimeLabel.hidden = YES;
    if (fAction) {
        collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:fAction];
    }
    //设置空的数据
    [self setEmptyCollectionView:collectionView];
}
-(void)setEmptyCollectionView:(UICollectionView *)colletionView
{
    colletionView.emptyDataSetSource = self;
    colletionView.emptyDataSetDelegate = self;
}
-(void)setEmptyTableView:(UITableView *)tableView
{
    tableView.emptyDataSetSource = self;
    tableView.emptyDataSetDelegate = self;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"empty"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *title = @"目前沒有任何資料";
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:17],
                                 NSForegroundColorAttributeName:GrayFontColor
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"可以查詢喔";

    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;

    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName:paragraph
                                 };

    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}
- (float)getLabelHeightWithText:(NSString *)text width:(float)width font: (float)font
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return rect.size.height;
}
- (void)logout{
    [[NSNotificationCenter defaultCenter]postNotificationName:NotificationLogoutNoti object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
