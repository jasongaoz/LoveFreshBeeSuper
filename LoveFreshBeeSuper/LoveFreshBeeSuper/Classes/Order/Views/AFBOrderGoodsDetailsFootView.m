//
//  AFBOrderGoodsDetailsFootView.m
//  LoveFreshBeeSuper
//
//  Created by Colbert Zhan on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderGoodsDetailsFootView.h"

@implementation AFBOrderGoodsDetailsFootView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49);
    
    UIButton *favoriteBtn = [[UIButton alloc] init];
    [favoriteBtn setAttributedTitle:[NSAttributedString ay_imageTextWithImage:[UIImage imageNamed:@"non_collection"] imageW:30 imageH:30 title:@"收藏" fontSize:11 titleColor:[UIColor blackColor] spacing:6] forState:UIControlStateNormal];
    self.favoriteBtn = favoriteBtn;
    [self addSubview:favoriteBtn];
    
    UILabel *addDoodsLab = [UILabel ay_labelWithText:@"添加商品：" color:[UIColor blackColor] font:14];
    [self addSubview:addDoodsLab];
    
    AFBOrderIncreaseAndReduceView * increaseAndReduceView = [[AFBOrderIncreaseAndReduceView alloc] init];
    self.increaseAndReduceView = increaseAndReduceView;
    [self addSubview:increaseAndReduceView];
    
    [favoriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(2);
        make.left.equalTo(self).offset(16);
    }];
    
    [addDoodsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.left.equalTo(favoriteBtn.mas_right).offset(24);
    }];
    
    [increaseAndReduceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.left.equalTo(addDoodsLab.mas_right).offset(4);
    }];
    
}

@end
