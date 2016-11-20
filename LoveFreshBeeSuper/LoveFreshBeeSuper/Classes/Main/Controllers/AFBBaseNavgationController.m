//
//  AFBBaseNavgationController.m
//  LoveFreshBee
//
//  Created by Adam on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//


#import "AFBBaseNavgationController.h"

@interface AFBBaseNavgationController ()

@end

@implementation AFBBaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.navigationBar.barTintColor = kBaseColor;
}

//当push到子控制器时，隐藏底部的tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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
