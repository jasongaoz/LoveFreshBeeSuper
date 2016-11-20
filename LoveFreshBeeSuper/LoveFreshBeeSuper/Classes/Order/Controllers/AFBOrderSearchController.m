//
//  AFBOrderSearchController.m
//  LoveFreshBee
//
//  Created by Colbert Zhan on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderSearchController.h"
#import "AFBOrderSearchHeadView.h"

@interface AFBOrderSearchController ()

@end

@implementation AFBOrderSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)setupUI {
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    //隐藏navigation的返回按钮
    self.navigationItem.hidesBackButton = YES;
    //不能设置translucent（穿透效果），否则会自定义view会整体下移
//    self.navigationController.navigationBar.translucent = NO;
    //设置navigationbar的透明度为零，否则会遮挡自定义view
    self.navigationController.navigationBar.alpha = 0;
    
    AFBOrderSearchHeadView *searchHeadView = [[[UINib nibWithNibName:@"AFBOrderSearchHeadView" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
    [self.view addSubview:searchHeadView];
    //添加返回按钮的点击事件，pop回原来的控制器
    [searchHeadView.btn_searchBack addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    CGSize size = searchHeadView.bounds.size;
    
    [searchHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(size.height);
    }];
    
    
}

- (void)backBtnClicked{
    
    self.navigationController.navigationBar.alpha = 1;
    [self.navigationController popViewControllerAnimated:YES];
}

//修改电池条的颜色状态
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
