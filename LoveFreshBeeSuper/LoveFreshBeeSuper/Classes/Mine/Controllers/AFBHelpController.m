//
//  AFBHelpController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHelpController.h"
#import "AFBWebViewController.h"


@interface AFBHelpController ()

@property (nonatomic, strong) UIWebView *webView;


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
    
    
    
    // 创建一个label
    UILabel *line2Lab = [[UILabel alloc] init];
    line2Lab.backgroundColor = [UIColor colorWithRed:228/255.0 green:226/255.0 blue:228/255.0 alpha:0.6];
    [helpView addSubview:line2Lab];
    
    // 创建第三个button
    UIButton *sugestionBtn = [[UIButton alloc] init];
    sugestionBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    sugestionBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [sugestionBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [sugestionBtn setTitle:@"意见反馈" forState:UIControlStateNormal];
    [sugestionBtn addTarget:self action:@selector(getIdear:) forControlEvents:UIControlEventTouchUpInside];
    [helpView addSubview:sugestionBtn];
    

    
    // 创建一个label
    UILabel *twoLine = [[UILabel alloc] init];
    twoLine.backgroundColor = [UIColor colorWithRed:228/255.0 green:226/255.0 blue:228/255.0 alpha:0.6];
    [helpView addSubview:twoLine];
    

    
    
    
    
    
    
    // 创建指示箭头1
    UIImageView *lastIndiaterView = [[UIImageView alloc] init];
    lastIndiaterView.image = [UIImage imageNamed:@"baidu_wallet_arrow_right"];
    [helpView addSubview:lastIndiaterView];
    
    // 创建指示箭头2
    UIImageView *nextIndiaterView = [[UIImageView alloc] init];
    nextIndiaterView.image = [UIImage imageNamed:@"baidu_wallet_arrow_right"];
    [helpView addSubview:nextIndiaterView];
    
    // 创建指示箭头3
    UIImageView *threeIndiaterView = [[UIImageView alloc] init];
    threeIndiaterView.image = [UIImage imageNamed:@"baidu_wallet_arrow_right"];
    [helpView addSubview:threeIndiaterView];
    
    
    
    //约束
    [helpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(0);
        make.height.mas_equalTo(120);
    }];
    
    [tellPhonebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(helpView).offset(-35);
        make.top.equalTo(helpView).offset(8);
        make.size.mas_equalTo(CGSizeMake(280, 25));
        
        [lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(tellPhonebtn.mas_bottom).offset(5);          make.left.right.equalTo(helpView);
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
        
    
        [twoLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(qustionsBtn.mas_bottom).offset(5);          make.left.right.equalTo(helpView);
            make.height.mas_equalTo(1);
        }];
        
        
        [sugestionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(tellPhonebtn).offset(-60);
            make.top.equalTo(twoLine.mas_bottom).offset(5);
            make.size.mas_equalTo(CGSizeMake(280, 25));
        }];

        [threeIndiaterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(7, 9));
            make.right.equalTo(helpView).offset(-15);
            make.top.equalTo(twoLine.mas_bottom).offset(15);
        }];
        
        
        
    }];
    
}

// 按钮（打电话）的监听方法
- (void)tellPhone:(UIButton *)btn
{
    
    UIAlertController *tellPhoneVC = [UIAlertController alertControllerWithTitle:@"是否拨打客服电话" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *weiXinBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
        if (_webView == nil) {
            _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
            NSLog(@"啦啦");
        }
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://13261936021"]]];
    }];
    
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    
    [tellPhoneVC addAction:weiXinBtn];
    [tellPhoneVC addAction:cancle];
    
    [self presentViewController:tellPhoneVC animated:YES completion:nil];
    
    
    
    
    
    
    
    
    
    
    
    //    NSLog(@"我要打电话了");
    //
    //    if (_webView == nil) {
    //        _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    //        NSLog(@"啦啦");
    //    }
    //    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://13261936021"]]];
}
- (void)getQuestions:(UIButton *)btn
{
    AFBWebViewController *vc = [[AFBWebViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)getIdear:(UIButton *)btn
{

    NSLog(@"我要push意见控制器了");
}
@end

