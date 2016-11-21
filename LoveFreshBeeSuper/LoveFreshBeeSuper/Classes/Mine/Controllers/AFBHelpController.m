//
//  AFBHelpController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHelpController.h"

@interface AFBHelpController ()

@end

@implementation AFBHelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"客服帮助";
    
    // 创建界面
    [self setupUI];
}
// 创建界面
- (void)setupUI
{
    self.view.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:236/255.0 alpha:1];
    // 创建一个View
    UIView *helpView = [[UIView alloc] init];
    helpView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:helpView];
  
    // 创建一个label
    UILabel *lineLab = [[UILabel alloc] init];
    lineLab.backgroundColor = [UIColor colorWithRed:228/255.0 green:226/255.0 blue:228/255.0 alpha:0.6];
    [helpView addSubview:lineLab];
   
    // 创建第一个button
    UIButton *tellPhonebtn = [[UIButton alloc] init];
    tellPhonebtn.titleLabel.font = [UIFont systemFontOfSize:15];
    tellPhonebtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [tellPhonebtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [tellPhonebtn setTitle:@"客服电话: 400-8484-842" forState:UIControlStateNormal];
    [tellPhonebtn addTarget:self action:@selector(tellPhone:) forControlEvents:UIControlEventTouchUpInside];
    [helpView addSubview:tellPhonebtn];
  
    // 创建第二个(常见问题)按钮
    UIButton *qustionsBtn = [[UIButton alloc] init];
    [qustionsBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    qustionsBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    qustionsBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    qustionsBtn.backgroundColor = [UIColor whiteColor];
    [qustionsBtn setTitle:@"常见问题" forState:UIControlStateNormal];
    [qustionsBtn addTarget:self action:@selector(getQuestions:) forControlEvents:UIControlEventTouchUpInside];
    [helpView addSubview:qustionsBtn];
   
    // 创建指示箭头1
    UIImageView *lastIndiaterView = [[UIImageView alloc] init];
    lastIndiaterView.image = [UIImage imageNamed:@"baidu_wallet_arrow_right"];
    [helpView addSubview:lastIndiaterView];
   
    // 创建指示箭头2
    UIImageView *nextIndiaterView = [[UIImageView alloc] init];
    nextIndiaterView.image = [UIImage imageNamed:@"baidu_wallet_arrow_right"];
    [helpView addSubview:nextIndiaterView];
    //约束
    [helpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(10);
        make.height.mas_equalTo(80);
    }];
    
    [tellPhonebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(helpView).offset(-30);
        make.top.equalTo(helpView).offset(10);
        make.size.mas_equalTo(CGSizeMake(280, 25));

    [lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(helpView);
        make.left.right.equalTo(helpView);
        make.height.mas_equalTo(1);
    }];
    
    [qustionsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tellPhonebtn).offset(-60);
        make.top.equalTo(lineLab.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(280, 25));
    }];
    
        [lastIndiaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(7, 9));
        make.right.equalTo(helpView).offset(-15);
        make.top.equalTo(helpView).offset(15);
    }];

    [nextIndiaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(7, 9));
        make.top.equalTo(lineLab.mas_bottom).offset(15);
        make.right.equalTo(helpView).offset(-15);
    }];
}];
     
}

// 按钮（打电话）的监听方法
- (void)tellPhone:(UIButton *)btn
{
    NSLog(@"我要打电话了");
}
- (void)getQuestions:(UIButton *)btn
{
    NSLog(@"常见问题");
}
@end

