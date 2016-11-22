//
//  AFBHomeThreeCell.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeThreeCell.h"

@interface AFBHomeThreeCell()<CAAnimationDelegate>

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
    countLabel.font = [UIFont systemFontOfSize:12];
    countLabel.textColor = [UIColor grayColor];
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
    
    //设置关联
    self.imageView = imageView;
    self.nameLabel = nameLabel;
    self.selectView = selectView;
    self.payView = payView;
    self.countLabel = countLabel;
}
//button点击事件
- (void)clickButton:(UIButton *)sender{
    //1坐标转换
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _startP = [self convertPoint:self.imageView.center toView:window];

    UIImage *ima = self.imageView.image;
    UIImageView *imaV = [[UIImageView alloc]initWithImage:ima];
    [window addSubview:imaV];
    imaV.center = _startP;
    imaV.bounds = CGRectMake(0, 0, 160, 160);
    
    CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CABasicAnimation *basicScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    CABasicAnimation *basicOpacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    UIBezierPath *path = [UIBezierPath bezierPath];
    //keyAnimation
    CGFloat wigth = [UIScreen mainScreen].bounds.size.width/8;
    CGFloat endX = wigth*5;
    [path moveToPoint:_startP];
    CGPoint controlP = CGPointMake(_startP.x, _startP.y-200);
    CGPoint endP = CGPointMake(endX, [UIScreen mainScreen].bounds.size.height-40);
    [path addQuadCurveToPoint:endP controlPoint:controlP];
    key.path = path.CGPath;
    key.duration = 1;
    [key setValue:imaV forKey:@"key"];
    key.removedOnCompletion = NO;
    key.fillMode = kCAFillModeForwards;
    
    //basicScale
    basicScale.fromValue = @(1);
    basicScale.toValue = @(0.1);
    basicScale.duration = 1;
    basicScale.removedOnCompletion = NO;
    basicScale.fillMode = kCAFillModeForwards;
    
    //basicOpacity
    basicOpacity.duration = 1;
    basicOpacity.fromValue = @(1);
    basicOpacity.toValue = @(0.5);
    basicOpacity.removedOnCompletion = NO;
    basicOpacity.fillMode = kCAFillModeForwards;
    
    //添加动画

    key.delegate = self;
    [imaV.layer addAnimation:key forKey:@"keyAmimation"];
    [imaV.layer addAnimation:basicScale forKey:@"basicScale"];
    [imaV.layer addAnimation:basicOpacity forKey:@"basicOpacity"];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    UIImageView *imaV = [anim valueForKey:@"key"];
    [imaV removeFromSuperview];
}
//设置数据
- (void)setModel:(AFBHomeThreeModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.nameLabel.text = model.name;
    self.countLabel.text = model.specifics;
}

@end
