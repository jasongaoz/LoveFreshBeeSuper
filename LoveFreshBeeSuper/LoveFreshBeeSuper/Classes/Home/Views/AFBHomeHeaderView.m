//
//  AFBHomeHeaderView.m
//  LoveFreshBee
//
//  Created by 王志华 on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeHeaderView.h"
#import <SDCycleScrollView.h>
#import "AYAddition.h"
#import <Masonry.h>


@interface AFBHomeHeaderView () <SDCycleScrollViewDelegate>

@property (nonatomic,weak) SDCycleScrollView * cycleScrollView;

@end

static CGFloat btnWH = 50;

@implementation AFBHomeHeaderView

#pragma mark - 重写构造方法
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

#pragma mark - 搭建界面
- (void)setUpUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    //MARK:设置滚动图片视图
    [self setCycleScrollView];
    
    
    //MARK:设置四个按钮
    [self addBtn];
}

- (void)setCycleScrollView{
    
//    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
    
    NSArray * imagesURLString = @[_image1stURLString,
                                 _image2ndURLString,
                                  _image3rdURLString,
                                  _image4thURLString,
                                  _image5thURLString];
    
    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageURLStringsGroup:imagesURLString];
    
    
    [self addSubview:cycleScrollView];
    
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(120);
    }];
    
    _cycleScrollView = cycleScrollView;
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
}


#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"---点击了第%ld张图片", (long)index);
}

#pragma mark - 添加四个按钮
- (void)addBtn{
    
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - btnWH * 4) / 5;
    
    //抽奖按钮
    UIButton * btnDraw = [self setBtnWithImageName:@"h1" title:@"抽奖"];
    
    [btnDraw mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_cycleScrollView.mas_bottom).offset(10);
        make.left.mas_equalTo(self).offset(margin);
    }];
    
    //秒杀按钮
    UIButton * btnSecKill = [self setBtnWithImageName:@"h2" title:@"秒杀"];
    
    [btnSecKill mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(btnDraw);
        make.left.mas_equalTo(btnDraw.mas_right).offset(margin);
    }];
    
    //抢红包按钮
    UIButton * btnRedBag = [self setBtnWithImageName:@"h3" title:@"抢红包"];
    
    [btnRedBag mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(btnSecKill);
        make.left.mas_equalTo(btnSecKill.mas_right).offset(margin);
    }];
    
    //蜂抱团按钮
    UIButton * btnBee = [self setBtnWithImageName:@"h4" title:@"蜂抱团"];
    
    [btnBee mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(btnRedBag);
        make.left.mas_equalTo(btnRedBag.mas_right).offset(margin);
    }];
    
    
}

#pragma mark - 创建按钮
- (UIButton *)setBtnWithImageName:(NSString *)imageName title:(NSString *)title{
    UIButton * btn = [[UIButton alloc] init];
    
    [btn setAttributedTitle:[NSAttributedString ay_imageTextWithImage:[UIImage imageNamed:imageName] imageWH:btnWH title:title fontSize:14 titleColor:[UIColor blackColor] spacing:3] forState:UIControlStateNormal];
    
    btn.titleLabel.numberOfLines = 0;
    
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [btn sizeToFit];
    
    [self addSubview:btn];
    
    return btn;
}


#pragma mark - 实现点击事件
- (void)clickBtn:(UIButton *)sender{
    
    
}

@end
