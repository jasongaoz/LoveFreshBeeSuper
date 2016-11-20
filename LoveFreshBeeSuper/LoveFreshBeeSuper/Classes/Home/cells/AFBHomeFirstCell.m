//
//  AFBHomeFirstCell.m
//  LoveFreshBeeSuper
//
//  Created by 王志华 on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeFirstCell.h"
#import "AFBHomeHeaderView.h"

@implementation AFBHomeFirstCell

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    
    return self;
}

#pragma mark - 搭建界面
- (void)setUpUI{

    AFBHomeHeaderView * view = [AFBHomeHeaderView new];
    
    [self.contentView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.contentView);
    }];
}

@end
