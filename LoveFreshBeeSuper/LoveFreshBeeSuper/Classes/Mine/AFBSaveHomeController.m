//
//  AFBSaveHomeController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/23.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBSaveHomeController.h"
#import "AFBHolderView.h"


@interface AFBSaveHomeController ()

@end

@implementation AFBSaveHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    // 搭建界面
    [self setupUI];
   // 设置导航条
    [self setNavgationBar];
    
    
}
// 设置导航条
- (void)setNavgationBar
{
    self.title = @"店铺收藏";
    UIBarButtonItem *editBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(changeData:)];
    editBtn.tintColor = [UIColor darkGrayColor];
    self.navigationItem.rightBarButtonItem = editBtn;
}
- (void)changeData:(UIBarButtonItem *)btn
{
    NSLog(@"改变");
    
}
// 搭建UI
- (void)setupUI
{
    // 创建占位图片
    CGFloat holdViewWH = 160;
    AFBHolderView *view = [AFBHolderView creatHolderViewWithImageName:@"v2_store_empty" lbName:@"~~~空空如也~~~"];
    view.frame = CGRectMake((kScreenWidth - holdViewWH)/2, (kScreenHeight - holdViewWH)/2,holdViewWH , holdViewWH);
    [self.view addSubview:view];

}

@end
