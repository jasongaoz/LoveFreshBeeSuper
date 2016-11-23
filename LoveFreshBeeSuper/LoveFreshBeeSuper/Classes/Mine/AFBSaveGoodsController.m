//
//  AFBSaveGoodsController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/23.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBSaveGoodsController.h"
#import "AFBHolderView.h"


@interface AFBSaveGoodsController ()

@end

@implementation AFBSaveGoodsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.view.backgroundColor = [UIColor whiteColor];
}

// 搭建界面
- (void)setupUI
{

    self.title = @"商品收藏";
    
    UIBarButtonItem *editBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(changeData)];
    editBtn.tintColor = [UIColor darkGrayColor];
    self.navigationItem.rightBarButtonItem = editBtn;
    
    // 占位图片
    
    CGFloat holdViewWH = 160;
    AFBHolderView *view = [AFBHolderView creatHolderViewWithImageName:@"v2_store_empty" lbName:@"~~~空空如也~~~"];
    view.frame = CGRectMake((kScreenWidth - holdViewWH)/2, (kScreenHeight - holdViewWH)/2,holdViewWH , holdViewWH);
    [self.view addSubview:view];

}
// 编辑方法的实现
- (void)changeData
{
    NSLog(@"");
}
@end
