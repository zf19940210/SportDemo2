//  BaseViewController.h
//  YDXZ
//  Created by niecong on 2018/6/11.
//  Copyright © 2018年 niecong. All rights reserved.
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//请求数据
@property (nonatomic,strong)NSMutableArray *dataArray;
//初始化的页码
@property (nonatomic,assign)int currentpage;
///分享类型
@property (nonatomic,assign)int shareType;
/// 左侧返回按钮
@property (nonatomic, strong, readonly) UIButton *backButton;
/// 设置UINavbar左按钮（图片）
- (void)setLeftButton:(UIImage *)image;
/// 设置UINavbar左按钮（文字）
- (void)setLeftButtonText:(NSString *)text;
/// 设置UINavbar右按钮（图片）
- (void)setRightButton:(UIImage *)image;
/// 设置UINavbar右按钮（文字）
- (void)setRightButtonText:(NSString *)text;
//  设置导航栏左键点击事件
- (void)onLeftBtnAction:(UIButton *)button;
/// 设置导航栏右键点击事件
- (void)onRightBtnAction:(UIButton *)button;
/// 拨打电话
- (void)callPhone:(NSString *)phoneStr;
///分享的方法
-(void)shareMethod;

- (void)logout;

//刷新列表(tableview)
- (void)setViewRefreshTableView:(UITableView *)tableView withHeaderAction:(SEL)hAction andFooterAction:(SEL)fAction target:(id)target;
//刷新列表(collectionView)
- (void)setViewRefreshColletionView:(UICollectionView *)collectionView withHeaderAction:(SEL)hAction andFooterAction:(SEL)fAction target:(id)target;
//显示数据为空
-(void)setEmptyTableView:(UITableView *)tableView;
-(void)setEmptyCollectionView:(UICollectionView *)colletionView;
//获取高度
- (float)getLabelHeightWithText:(NSString *)text width:(float)width font: (float)font;
@end
