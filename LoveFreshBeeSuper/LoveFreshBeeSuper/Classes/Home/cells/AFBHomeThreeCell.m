//
//  AFBHomeThreeCell.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeThreeCell.h"

@interface AFBHomeThreeCell()
@property(nonatomic,weak)UIImageView *imageView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UIImageView *selectView;

@end

@implementation AFBHomeThreeCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    //创建空间
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    [self addSubview:nameLabel];
    
    UIImageView *selectView = [[UIImageView alloc]init];
    [self addSubview:selectView];
    
    UIImageView *payView = [[UIImageView alloc]init];
    [self addSubview:payView];
    
    UILabel *countLabel = [[UILabel alloc]init];
    [self addSubview:countLabel];
    
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"v2_increased"] forState:UIControlStateHighlighted];
    [self addSubview:button];
    
    //设置约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(100);
    }];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(5);
        make.left.equalTo(self);
    }];
    [selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(nameLabel).offset(5);
        make.size.mas_equalTo(CGSizeMake(18, 12));
    }];
    [payView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(selectView.mas_right);
        make.top.equalTo(selectView);
        make.size.mas_equalTo(CGSizeMake(25, 12));
    }];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(selectView.mas_bottom).offset(5);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
