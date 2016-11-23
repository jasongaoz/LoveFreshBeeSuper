//
//  NewsController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "NewsController.h"
#import "MineTopVIew.h"
#import "Model.h"
#import "TwoTypeCell.h"
#import "NewsCell.h"
#import "CellView.h"
#import "MineMyOrderController.h"
#import "AFBHelpController.h"
#import "AFBMyMessageController.h"
#import "AFBSaveGoodsController.h"
#import "AFBSaveHomeController.h"
#import "AFBMineMyCardController.h"


static NSString * oneCell = @"oneCell";
static NSString * twoCell = @"twoCell";

@interface NewsController ()
<
UITableViewDelegate,
UITableViewDataSource,
MineTopVIewDelegate,
NewsCellDelegate,
CellViewDelegate,
TwoTypeCellDegate
>

@end

@implementation NewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 改变导航条的透明度 使其隐藏
- (void)viewWillAppear:(BOOL)animated {
    // 设置导航条的透明度
    self.navigationController.navigationBar.alpha = 0;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

#pragma mark - 跳转到其他界面 导航条的透明度恢复
- (void)viewWillDisappear:(BOOL)animated {
    // 复原
    self.navigationController.navigationBar.alpha = 1.0;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bbb.png"] forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
// 搭建界面
- (void)setupUI
{
    // 1. 头部视图
    CGFloat topViewH = 200;
    MineTopVIew *topView = [MineTopVIew creatTopViewWithFrame: CGRectMake(0, 0, kScreenWidth, topViewH)];
    topView.delegate = self;
    [self.view addSubview:topView];
    
    // 2.tableView 的创建
    UITableView *tableVIew = [[UITableView alloc] initWithFrame:CGRectMake(0, topViewH, kScreenWidth, kScreenHeight - topViewH - 49) style:UITableViewStyleGrouped];
    tableVIew.rowHeight = 120;
    tableVIew.delegate = self;
    tableVIew.dataSource = self;
    [tableVIew registerClass:[NewsCell class] forCellReuseIdentifier:oneCell];
    [tableVIew registerClass:[TwoTypeCell class] forCellReuseIdentifier:twoCell ];
    tableVIew.tableFooterView = [self creatFooterView];
    [self.view addSubview:tableVIew];
}
#pragma mark - MineTopVIewDelegate
// 实现箭头的代理方法
- (void)arrowOfMineTopVIewClicked {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
// 商品收藏 和店铺收藏的代理方法实现
- (void)button:(UIButton *)btn ofMineTopVIewClicked:(MineTopVIew *)topView {
    if (btn.tag == 1)
    {
        AFBSaveGoodsController *saveGoodsVc = [[AFBSaveGoodsController alloc] init];
        [self.navigationController pushViewController:saveGoodsVc animated:YES];
    }
    else
    {
        AFBSaveHomeController *homeVC = [[AFBSaveHomeController alloc] init];
        [self.navigationController pushViewController:homeVC animated:YES];
    }
}
// 第一个行cell的实现
- (void)cellClicked:(NewsCell *)cell ofTopView:(CellView *)topView btn:(UIButton *)btn
{
    if (btn.tag == 1)
    {
        UIViewController *vc1 = [[UIViewController alloc] init];
        vc1.view.backgroundColor = [UIColor redColor];
        [self.navigationController pushViewController:vc1 animated:YES];
    }
    else if (btn.tag == 2)
    {
        UIViewController *vc2 = [[UIViewController alloc] init];
        vc2.view.backgroundColor = [UIColor greenColor];

        [self.navigationController pushViewController:vc2 animated:YES];
    }
    else if(btn.tag == 3)
    {
        UIViewController *vc3 = [[UIViewController alloc] init];
        vc3.view.backgroundColor = [UIColor yellowColor];

        [self.navigationController pushViewController:vc3 animated:YES];
    }
    else
    {
        UIViewController *vc4 = [[UIViewController alloc] init];
        vc4.view.backgroundColor = [UIColor orangeColor];

        [self.navigationController pushViewController:vc4 animated:YES];
    }
}

// 创建footerView
- (UIView *)creatFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, 160)];
    
    // 2. 两个view
    CellView *oneView = [CellView setupTopViewWithImageStrings:@[@"Integral-mall", @"v2_my_address_icon", @"icon_message", @"v2_my_feedback_icon"] andTitles:@[@"积分商城", @"收货地址", @"我的消息", @"客服/反馈"]];
    oneView.frame = CGRectMake(0, 0, kScreenWidth, 80);
    oneView.delegate = self;
    [footerView addSubview:oneView];

    CellView *twoView = [CellView setupTopViewWithImageStrings:@[@"v2_my_cooperate", @"", @"", @""] andTitles:@[@"加盟合作", @"", @"", @""]];
    twoView.delegate = self;
    twoView.frame = CGRectMake(0, 80, kScreenWidth, 80);
    [footerView addSubview:twoView];
    return footerView;

}

#pragma mark - 数据源代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:oneCell forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        TwoTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:twoCell forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }

    return nil;
}

// 中间cell的代理方法实现
- (void)cellWithView:(TwoTypeCell *)twoCell view:(UIControl *)samllView
{
    
    if (samllView.tag == 2)
    {
        AFBMineMyCardController *cardVC = [[AFBMineMyCardController alloc] init];
        [self.navigationController pushViewController:cardVC animated:YES];
    }
    else
    {
        NSLog(@"hahha");
    }
}


#pragma mark - NewsCellDelegate
- (void)topViewClicked:(NewsCell *)topView {

    MineMyOrderController *vc = [[MineMyOrderController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
};

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return section == 1 ? 10 : 0.01;
}

- (void)btn:(UIButton *)btn ofTopView:(CellView *)topView
{
 
    if (btn.tag == 1 )
    {
        UIViewController *vc1 = [UIViewController alloc];
        vc1.view.backgroundColor = [UIColor blueColor];
        [self.navigationController pushViewController:vc1 animated:YES];
    }
    else if (btn.tag == 2)
    {
        UIViewController *vc2 = [UIViewController alloc];
        vc2.view.backgroundColor = [UIColor redColor];
        [self.navigationController pushViewController:vc2 animated:YES];

    }
    else if (btn.tag == 3)
    {
        AFBMyMessageController *messageVC = [AFBMyMessageController alloc];
        messageVC.view.backgroundColor = [UIColor purpleColor];
        [self.navigationController pushViewController:messageVC animated:YES];

    }
    else
    {
    
        AFBHelpController *helpVC = [AFBHelpController alloc];
        [self.navigationController pushViewController:helpVC animated:YES];

    }
}
@end
