//
//  AFBMyMessageController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBMyMessageController.h"

@interface AFBMyMessageController ()

@property (nonatomic, strong) UISegmentedControl *segment;


@end

@implementation AFBMyMessageController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"我的消息";
    self.view.backgroundColor = [UIColor yellowColor];
    // 1. 创建segment
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"系统消息", @"用户消息"]];
    self.navigationItem.titleView = _segment;
    _segment.momentary = NO;
    _segment.selectedSegmentIndex = 0;
    [_segment addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventValueChanged]; // 添加响应方法
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:14],NSFontAttributeName ,nil];
    [_segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    // 2. 创建一个scrllView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height);
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.backgroundColor = [UIColor greenColor];
    
    // 创建第一个view
    UIView *oneView = [[UIView alloc] init];
    [scrollView addSubview:oneView];
    oneView.backgroundColor = [UIColor brownColor];
    
    // 创建第两个view
    UIView *twoView = [[UIView alloc] init];
    [scrollView addSubview:twoView];
    twoView.backgroundColor = [UIColor purpleColor];
    
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(self.view);
    }];
    
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(scrollView);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
    }];
    
}
// 相应方法
- (void)selectItem:(UISegmentedControl *)segment
{
    if (segment.selectedSegmentIndex == 0)
    {
        //        self.view.backgroundColor = [UIColor blueColor];
    }
    else
    {
        //        self.view.backgroundColor = [UIColor cyanColor];
    }
    
    
}
@end
