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
@property(nonatomic,weak)UIImageView *payView;
@property(nonatomic,weak)UILabel *countLabel;
@end

@implementation AFBHomeThreeCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    //创建控件
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = [UIFont systemFontOfSize:20];
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
    //button点击事件
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
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
        make.right.bottom.equalTo(self).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    //设置关联
    self.imageView = imageView;
    self.nameLabel = nameLabel;
    self.selectView = selectView;
    self.payView = payView;
    self.countLabel = countLabel;
}
//button点击事件
- (void)clickButton:(UIButton *)sender{
    
}
//设置数据
- (void)setModel:(AFBHomeThreeModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.nameLabel.text = model.name;
    self.countLabel.text = model.specifics;
}










@end
