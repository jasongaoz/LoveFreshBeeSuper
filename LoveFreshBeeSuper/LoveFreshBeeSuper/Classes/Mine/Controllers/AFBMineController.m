//
//  AFBMineController.m
//  LoveFreshBee
//
//  Created by Adam on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBMineController.h"
#import "AFBMineTableViewCell.h"
#import "AFBMineMyCardController.h"
#import "AFBHelpController.h"
#import "TopView.h"
#import "AFBMyMessageController.h"
#import "MineModel.h"


static NSString *mainFirstCell = @"mainFirstCell";

@interface AFBMineController ()
<
UITableViewDelegate,
UITableViewDataSource,
TopViewDelegate
>

@property (nonatomic, strong) NSMutableArray *models;

@end

@implementation AFBMineController

/**
 *  懒加载
 */
- (NSMutableArray *)models
{
    if (_models == nil)
    {
        _models = [[NSMutableArray alloc] init];
    }
    return _models;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    /// 创建数据
    NSArray *icons = @[@"v2_my_address_icon-1", @"v2_store_empty-1", @"fenxiang", @"online_service", @"feedback_opinion"];
    NSArray *titles = @[@"我的收货地址", @"我的店铺", @"把爱鲜蜂分享给朋友", @"客服帮助", @"意见反馈"];
    for (int i = 0; i < icons.count; i++) {
        MineModel *model = [[MineModel alloc] init];
        model.iconStr = icons[i];
        model.titleStr = titles[i];
        [self.models addObject:model];
    }
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

#pragma mark - 搭建界面
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:236/255.0 alpha:1];
    
    // 1.创建头部headerView
    UIView *headerView = [[UIView alloc] init];
    [self.view addSubview:headerView];
    
    //1.1 添加一个背景imageView
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"v2_my_avatar_bg"];
    [headerView addSubview:imageView];
    
    // 创建个人头像
    UIImageView *cicleView = [[UIImageView alloc] init];
    cicleView.contentMode = UIViewContentModeCenter;
    cicleView.backgroundColor = [UIColor whiteColor];
    cicleView.layer.cornerRadius = 23;
    cicleView.image = [UIImage imageNamed:@"v2_my"];
    [headerView addSubview:cicleView];
    
    // 添加一个电话lebel
    UILabel *lb_tellphoneNum = [[UILabel alloc] init];
    lb_tellphoneNum.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:lb_tellphoneNum];
    lb_tellphoneNum.text = @"18910328555";
    lb_tellphoneNum.textColor = [UIColor whiteColor];
    
    // 1.2 创建一个小view ，添加到头部view中
    TopView *topVw = [TopView setupTopViewWithImageStrings:@[@"icon_tuikuan", @"v2_empty_pointsDeatil", @"UMS_comment_normal_white"] andTitles:@[@"我的订单", @"优惠券", @"我的消息"]];
    topVw.delegate = self;
    [headerView addSubview:topVw];
    
    // 2. 创建下部的tableView
    UITableView *mineTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    mineTableView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:236/255.0 alpha:1];
    // 2.1 注册
    [mineTableView registerClass:[AFBMineTableViewCell class] forCellReuseIdentifier:mainFirstCell];
    //2.2 设置代理
    mineTableView.dataSource = self;
    mineTableView.delegate = self;
    // 隐藏系统分割线
    mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mineTableView];
    
    
    // 3.设置约束
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(180);
    }];
    [mineTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView.mas_bottom).offset(8);
        make.left.right.bottom.equalTo(self.view);
    }];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(headerView);
    }];
    // threebtn的约束
    [topVw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(headerView);
        make.height.mas_equalTo(55);
    }];
    
    [cicleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.top.equalTo(headerView).offset(25);
        make.size.mas_equalTo(CGSizeMake(46, 46));
    }];
    [lb_tellphoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(cicleView);
        make.top.equalTo(cicleView.mas_bottom).offset(14);
        make.size.mas_equalTo(CGSizeMake(140, 20));
    }];
}


#pragma mark - TopViewDelegate（三个按钮的点击事件）
- (void)btn:(UIButton *)btn ofTopView:(TopView *)topView {
    
    switch (btn.tag) {
        case 1: {
            NSLog(@"跳转我的订单控制器");
            break;
        }
        case 2: {
            AFBMineMyCardController *cardController = [[AFBMineMyCardController alloc] init];
            [self.navigationController pushViewController:cardController animated:YES];
            break;
        }
        default: {
            NSLog(@"我的消息");
            
            AFBMyMessageController *vc = [[AFBMyMessageController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
    }
}



#pragma mark - 代理方法
// 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
// 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 1 ? 1 : 2;
}
// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFBMineTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:mainFirstCell forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.model = self.models[indexPath.row];
    } else if (indexPath.section == 1) {
        cell.model = self.models[2];
    } else {
        cell.model = self.models[3 + indexPath.row];
    }
    
    cell.line.hidden = indexPath.row == 1 || indexPath.section == 1;
    
    return cell;
}
#pragma mark - 组尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 0.1;
    }
    return 10;
}
// 代理方法 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        NSLog(@"我的收货地址");
    }
    else if (indexPath.section == 0 && indexPath.row == 1)
    {
        NSLog(@"我的店铺");
    }
    else if (indexPath.section == 1)
    {
        // 分享给朋友
        [self goToShare];
    }
    else if (indexPath.section == 2 && indexPath.row == 0)
    {
        AFBHelpController *helpVC = [[AFBHelpController alloc] init];
        [self.navigationController pushViewController:helpVC animated:YES];
    }
    else
    {
        
    }
    
    
    
    
}


/**
 分享给朋友
 */
- (void)goToShare {
    UIAlertController *bottonAlertVC = [UIAlertController alertControllerWithTitle:@"分享到" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *weiXinBtn = [UIAlertAction actionWithTitle:@"微信好友" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"微信好友");
    }];
    
    UIAlertAction *weiXinFriendBtn = [UIAlertAction actionWithTitle:@"微信朋友圈" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"微信朋友圈");
    }];
    
    UIAlertAction *xinLangWeiboBtn = [UIAlertAction actionWithTitle:@"新浪微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"新浪微博");
    }];
    
    UIAlertAction *qqSpace = [UIAlertAction actionWithTitle:@"QQ空间" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"qq空间");
    }];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    
    [bottonAlertVC addAction:weiXinBtn];
    [bottonAlertVC addAction:weiXinFriendBtn];
    [bottonAlertVC addAction:xinLangWeiboBtn];
    [bottonAlertVC addAction:qqSpace];
    [bottonAlertVC addAction:cancle];
    
    [self presentViewController:bottonAlertVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
