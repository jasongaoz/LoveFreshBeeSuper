//
//  AFBHomeThreeCell.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeThreeCell.h"

@interface AFBHomeThreeCell()

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
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
//    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.font = [UIFont boldSystemFontOfSize:12];
    [self addSubview:nameLabel];
    
    UIImageView *selectView = [[UIImageView alloc]init];
    selectView.image = [UIImage imageNamed:@"jingxuan.png"];
    [self addSubview:selectView];
    
    UIImageView *payView = [[UIImageView alloc]init];
    payView.image = [UIImage imageNamed:@"buyOne.png"];
    [self addSubview:payView];
    
    UILabel *countLabel = [[UILabel alloc]init];
    countLabel.font = [UIFont systemFontOfSize:10];
    countLabel.textColor = [UIColor grayColor];
    [self addSubview:countLabel];
    
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"v2_increased"] forState:UIControlStateHighlighted];
    [self addSubview:button];
    //button点击事件
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *market_price = [[UILabel alloc]init];
    market_price.textColor = [UIColor grayColor];
    market_price.font = [UIFont systemFontOfSize:10];
    [self addSubview:market_price];
    self.market_price = market_price;
    
    UILabel *partner_price = [[UILabel alloc]init];
    partner_price.textColor = [UIColor redColor];
    partner_price.font = [UIFont systemFontOfSize:12];
    [self addSubview:partner_price];
    self.partner_price = partner_price;
    
    
    //设置约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(160);
    }];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom);
        make.right.equalTo(imageView);
        make.left.equalTo(self).offset(5);
    }];
    [selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(nameLabel.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(20, 13));
    }];
    [payView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(selectView.mas_right);
        make.top.equalTo(selectView);
        make.size.mas_equalTo(CGSizeMake(28, 13));
    }];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(selectView.mas_bottom);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [partner_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(countLabel);
        make.top.equalTo(countLabel.mas_bottom);
    }];
    
    [market_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(partner_price.mas_right).offset(2);
        make.bottom.equalTo(partner_price);
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
    //动画
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _startP = [self convertPoint:self.imageView.center toView:window];
    //数据传递
    _model.buyCount++;
    if ([_delegate respondsToSelector:@selector(homeThreeCell:withAddModel:withStartPoint:)]) {
        [_delegate homeThreeCell:self withAddModel:_model withStartPoint:_startP];
    }
}
//控件赋值
- (void)setModel:(AFBHomeThreeModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.nameLabel.text = model.name;
    self.countLabel.text = model.specifics;
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"￥%@",model.market_price] attributes:attribtDic];
    self.market_price.attributedText = attrStr;
    self.partner_price.text = [NSString stringWithFormat:@"￥%@",model.partner_price];
}

@end
