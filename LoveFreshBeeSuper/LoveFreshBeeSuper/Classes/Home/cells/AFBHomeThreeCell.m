//
//  AFBHomeThreeCell.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeThreeCell.h"

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
    
    //设置约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self);
        //        make.left.equalTo(self).offset(7);
        //        make.right.equalTo(self).offset(-7);
        //        make.height.mas_equalTo(100);
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(100);
    }];
}

@end
