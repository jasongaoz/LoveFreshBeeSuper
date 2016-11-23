//
//  AFBHomeController.m
//  LoveFreshBee
//
//  Created by Adam on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeController.h"

#import "AFBHomeCollectionController.h"

#import "AFBSweepViewController.h"
#import "AFBDownLoadManager.h"

#import "AFBDrawViewController.h"
#import "AFBSecKillViewController.h"
#import "AFBRedBagViewController.h"
#import "AFBBeeViewController.h"
#import "AFBNavigationBarView.h"

#import "AFBOrderSearchController.h"

#import <PYSearch.h>
#import <SVProgressHUD.h>

@interface AFBHomeController () <AFBHomeCollectionControllerDelegate,AFBNavigationBarViewDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,weak)AFBNavigationBarView *naviView;
@end

@implementation AFBHomeController{
    NSArray * _searchKeyWords;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    // Do any additional setup after loading the view.
}

#pragma mark - 自定义navigationbar
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    AFBNavigationBarView *view = [[AFBNavigationBarView alloc]init];
    view.delegate = self;
    [self.view addSubview:view];
    self.naviView = view;
    view.backgroundColor = [UIColor yellowColor];
    view.backgroundColor = [UIColor ay_colorWithR:254 G:222 B:50 alpha:0];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
}
- (void)viewDidDisappear:(BOOL)animated{
    [self.naviView removeFromSuperview];
}

- (void)getAlpha:(CGFloat)alpha{
    self.naviView.alpth = alpha;
}

#pragma mark - 搭建界面
- (void)setupUI{
    
    self.navigationItem.title = @"首页";
    //MARK:创建主页的collectionView
    AFBHomeCollectionController *collVc = [[AFBHomeCollectionController alloc]init];
    collVc.delegate = self;
    [self addChildViewController:collVc];
    [self.view addSubview:collVc.view];
    
    [collVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    //MARK:添加NavigationItem
//    [self addNavigationItem];
    
    [[AFBDownLoadManager shareManager] getHomeDataWithParameters:@1 CompleteBlock:^(NSDictionary *arrayH) {
//        NSLog(@"%@",arrayH);
    }];
}

#pragma mark - 拖拽手势的实现
- (void)panGR:(UIPanGestureRecognizer *)sender{
    CGPoint offset = [sender translationInView:sender.view];
    NSLog(@"%f",offset.y);
    [UIView animateWithDuration:0.5 animations:^{
        if (offset.y > 0) {
            _naviView.alpha = 0;
        }
    }];
}

#pragma mark - AFBNavigationBarViewDelegate代理方法
- (void)clickLeftButton{
    AFBSweepViewController * sweepVC = [AFBSweepViewController new];
    [self.navigationController pushViewController:sweepVC animated:YES];
}

- (void)clickRightButton{
    // 1. 创建热门搜索数组
    NSArray *hotSeaches = _searchKeyWords;
    // 2. 创建搜索控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"请输入商品关键字" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        // 开始(点击)搜索时执行以下代码
        // 如：跳转到指定控制器
        [searchViewController.navigationController pushViewController:[[AFBOrderSearchController alloc] init] animated:YES];
    }];
    // 3. 跳转到搜索控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav  animated:NO completion:nil];
}


#pragma mark - 代理方法实现
- (void)pushDrawView{
    NSLog(@"点击了抽奖");
    
    //跳转界面
    [self.navigationController pushViewController:[[AFBDrawViewController alloc] init] animated:YES];
}

- (void)pushSecKillView{
    NSLog(@"点击了秒杀");
    
    //跳转界面
    [self.navigationController pushViewController:[[AFBSecKillViewController alloc] init] animated:YES];
}

- (void)pushRedBagView{
    NSLog(@"点击了抢红包");
    
    //跳转界面
    [self.navigationController pushViewController:[[AFBRedBagViewController alloc] init] animated:YES];
}

- (void)pushBeeView{
    NSLog(@"点击了蜂抱团");
    
    //跳转界面
    [self.navigationController pushViewController:[[AFBBeeViewController alloc] init] animated:YES];
}

- (void)refreshStart{
    [UIView animateWithDuration:0.5 animations:^{
        self.naviView.alpha = 0;
    }];
}

- (void)refreshEnd{
    [UIView animateWithDuration:0.5 animations:^{
        self.naviView.alpha = 1;
    }];
}

#pragma mark - 加载数据
- (void)loadData{
    AFBDownLoadManager * manager = [AFBDownLoadManager shareManager];
    [manager getSearchKeyWordParameters:@(6) CompleteBlock:^(NSDictionary *dicH) {
//        NSLog(@"====%@",dicH[@"hotquery"]);
        _searchKeyWords = dicH[@"hotquery"];
    }];
}

@end
