//
//  AFBMyMessageController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBMyMessageController.h"
#import "AFBHolderView.h"
#import "SystemMessageController.h"
#import "UserMessageController.h"


@interface AFBMyMessageController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation AFBMyMessageController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    // 1、设置导航栏
    [self setupNavigationBar];
    
    // 2. 创建一个scrllView
    [self setupScrollView];
    
    // 3、创建scrollView的子控件
    [self setupSubviewsOfScrollView];
}

#pragma mark - 设置导航栏

- (void)backToSup
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)setupNavigationBar {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"baidu_wallet_pay_arrow_highlight"] style:UIBarButtonItemStylePlain target:self action:@selector(backToSup)];
    
    self.title = @"我的消息";
    
    // titleView
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"系统消息", @"用户消息"]];
    // 默认：NO
    _segment.momentary = NO;
    _segment.selectedSegmentIndex = 0;
    // 添加响应方法
    [_segment addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventValueChanged];
    // 设置字体样式
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:14],NSFontAttributeName ,nil];
    [_segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    self.navigationItem.titleView = _segment;
}

// 响应方法
- (void)selectItem:(UISegmentedControl *)segment {
    self.scrollView.contentOffset = CGPointMake(kScreenWidth * (CGFloat)segment.selectedSegmentIndex,0);
}


#pragma mark - 创建一个scrllView

- (void)setupScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(kScreenWidth * 2, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}


#pragma mark - 创建scrollView的子控件

- (void)setupSubviewsOfScrollView {
    
    SystemMessageController *sysVC = [[SystemMessageController alloc] init];
    [self addChildViewController:sysVC];
    sysVC.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
    [self.scrollView addSubview:sysVC.tableView];
    
    UserMessageController *userVC = [[UserMessageController alloc] init];
    [self addChildViewController:userVC];
    userVC.tableView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight - 64);
    [self.scrollView addSubview:userVC.tableView];
}





#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    int index = (int)(offsetX / kScreenWidth);
    _segment.selectedSegmentIndex = index;
}

@end
