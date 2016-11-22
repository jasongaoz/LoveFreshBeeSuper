//
//  AFBHomeFourCell.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeFourCell.h"

@implementation AFBHomeFourCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
//加载界面
- (void)setupUI{
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"查看所有商品" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:button];
    //1
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)clickButton:(UIButton *)sender{
    
}
@end
