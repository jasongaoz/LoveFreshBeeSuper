//
//  AFBMineMyCardController.m
//  LoveFreshBee
//
//  Created by xlx on 16/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBMineMyCardController.h"
#import "AFBMyCardCell.h"

@interface AFBMineMyCardController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation AFBMineMyCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"优惠券";
    UIBarButtonItem *rightItemBtn = [[UIBarButtonItem alloc] initWithTitle:@"使用规则" style:UIBarButtonItemStylePlain target:self action:@selector(clickrightBtn:)];
    self.navigationItem.rightBarButtonItem = rightItemBtn;
    [rightItemBtn setTintColor:[UIColor grayColor]];
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"v2_goback"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];    // 搭建UI
    [self setupUI];
}
// 创建界面
- (void)setupUI
{
    
    //1. 创建上面的view
    UIView *cardView = [self creatTopView];
    cardView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cardView];
    // 2. 创建下面的tableView
    UITableView *cardTableView = [[UITableView alloc] init];
    cardTableView.rowHeight = 80;
    [self.view addSubview:cardTableView];
    cardTableView.delegate = self;
    cardTableView.dataSource = self;
    
    [cardTableView registerClass:[AFBMyCardCell class] forCellReuseIdentifier:@"cardCell"];
    // 设置约束
    [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
        make.height.mas_equalTo(40);
    }];
    [cardTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(cardView.mas_bottom);
    }];
    
    
}
// 对上部view的封装
- (UIView *)creatTopView
{
    // 创建view
    UIView *cardView = [[UIView alloc] init];
    cardView.backgroundColor = [UIColor whiteColor];
    UITextField *textRoundField = [[UITextField alloc] init];
    textRoundField.borderStyle = UITextBorderStyleRoundedRect;
    [cardView addSubview:textRoundField];
    // 添加子控件
    UITextField *cardNumfield = [[UITextField alloc] init];
    cardNumfield.font = [UIFont systemFontOfSize:13];
    cardNumfield.borderStyle = UITextBorderStyleRoundedRect;
    cardNumfield.placeholder = @"请输入优惠券号码";
    cardNumfield.backgroundColor = [UIColor whiteColor];
    [cardView addSubview:cardNumfield];
    // 添加按钮（确定）
    UIButton *sureBtn = [[UIButton alloc] init];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    sureBtn.layer.cornerRadius = 5;
    sureBtn.backgroundColor = [UIColor orangeColor];
    [sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sureBtn setTitle:@"绑定" forState:UIControlStateNormal];
    [cardView addSubview:sureBtn];
    
    [cardNumfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cardView).offset(10);
        make.top.equalTo(cardView.mas_top).offset(5);
        make.bottom.equalTo(cardView).offset(-8);
        make.width.mas_equalTo(280);
    }];
    
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cardNumfield.mas_right).offset(15);
        make.top.equalTo(cardNumfield);
        make.bottom.equalTo(cardNumfield);
        make.right.equalTo(cardView).offset(-15);
    }];
    
    [textRoundField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(cardView);
        make.left.equalTo(cardView).offset(-5);
        make.right.equalTo(cardView).offset(5);
    }];
    return cardView;
}
// 按钮的点击事件
- (void)clickrightBtn:(UIBarButtonItem *)btn
{
    NSLog(@"我是使用规则");
}
- (void)back:(UIBarButtonItem *)btn
{
    [self popoverPresentationController];
}

#pragma mark - 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AFBMyCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardCell" forIndexPath:indexPath];
    
    return cell;
    
}

@end
