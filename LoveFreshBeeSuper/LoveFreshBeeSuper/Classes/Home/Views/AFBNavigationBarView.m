//
//  AFBNavigationBarView.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBNavigationBarView.h"
#import <Masonry.h>

@interface AFBNavigationBarView()
@property(nonatomic,weak)UIView *leftView;

@property(nonatomic,weak)UIView *centerView;
@property(nonatomic,weak)UIButton *leftButton;
@property(nonatomic,weak)UIButton *rightButton;
@property(nonatomic,weak)UIButton *centerButton;

@end

typedef enum : NSUInteger {
    kBtnLeft = 1,
    kBtnRight = 2
} kBtnState;

@implementation AFBNavigationBarView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    //view
    self.backgroundColor = [UIColor yellowColor];
    UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.6];
    leftView.layer.cornerRadius = 15;
    [self addSubview:leftView];
    self.leftView = leftView;
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.6];
    rightView.layer.cornerRadius = 15;
    [self addSubview:rightView];
    self.rightView = rightView;
    
    UIView *centerView = [[UIView alloc]init];
    centerView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.6];
    centerView.layer.cornerRadius = 15;
    [self addSubview:centerView];
    self.centerView = centerView;
    
    //button
    UIButton *buttonLeft = [[UIButton alloc]init];
    [buttonLeft setImage:[UIImage imageNamed:@"icon_black_scancode"] forState:UIControlStateHighlighted];
    [buttonLeft setImage:[UIImage imageNamed:@"icon_white_scancode"] forState:UIControlStateNormal];
    [self addSubview:buttonLeft];
    self.leftButton = buttonLeft;
    buttonLeft.tag = 1;
    [buttonLeft addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonRight = [[UIButton alloc]init];
    [buttonRight setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateHighlighted];
    [buttonRight setImage:[UIImage imageNamed:@"UMS_find"] forState:UIControlStateNormal];
    [self addSubview:buttonRight];
    self.rightButton = buttonLeft;
    buttonRight.tag = 2;
    [buttonRight addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonCenter = [[UIButton alloc]init];
    [buttonCenter setTitle:@"配送到：西三旗众腾建华大厦，建材西路23" forState:UIControlStateNormal];
    [buttonCenter setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonCenter setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonCenter.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:buttonCenter];
    self.centerButton = buttonCenter;
    //约束1
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(10);
        make.left.equalTo(self).offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(10);
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    //约束
    [buttonLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(10);
        make.left.equalTo(self).offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [buttonCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(10);
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
}
- (void)setAlpth:(CGFloat)alpth{
    self.backgroundColor = [UIColor ay_colorWithR:254 G:222 B:50 alpha:alpth];
    if (alpth>0) {
        self.leftView.transform = CGAffineTransformMakeScale(alpth+1, alpth+1);
        self.rightView.transform = CGAffineTransformMakeScale(alpth+1, alpth+1);
        self.centerView.transform = CGAffineTransformMakeScale(alpth+1, alpth+1);
        self.leftView.alpha = 1-alpth;
        self.rightView.alpha = 1-alpth;
        self.centerView.alpha = 1-alpth;
    }
    if (alpth>=0.5) {
        [self.leftButton setHighlighted:YES];
        [self.centerButton setHighlighted:YES];
        [self.rightButton setHighlighted:YES];
    }else{
        [self.leftButton setHighlighted:NO];
        [self.centerButton setHighlighted:NO];
        [self.rightButton setHighlighted:NO];
    }

}

#pragma mark - 实现案件点击事件
- (void)clickBtn:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(clickLeftButton)]
        || [_delegate respondsToSelector:@selector(clickRightButton)]) {
        switch (sender.tag) {
            case kBtnLeft:
                [_delegate clickLeftButton];
                break;
            case kBtnRight:
                [_delegate clickRightButton];
                break;
            default:
                break;
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
