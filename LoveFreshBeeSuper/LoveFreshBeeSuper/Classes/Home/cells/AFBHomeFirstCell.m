//
//  AFBHomeFirstCell.m
//  LoveFreshBeeSuper
//
//  Created by 王志华 on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeFirstCell.h"

static CGFloat btnWH = 50;

@implementation AFBHomeFirstCell{
    SDCycleScrollView * _cycleScrollView;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    
    return self;
}

#pragma mark - 搭建界面
- (void)setUpUI{

    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self setCycleScrollView];
    [self addBtn];
}

#pragma mark - 设置滚动轮播器视图
- (void)setCycleScrollView{
    
    //    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
    
    NSArray * imagesURLString = @[@"http://img01.bqstatic.com/upload/activity/activity_v4_20575_1452217080_focus.jpg@90Q",
                                  @"http://img01.bqstatic.com/upload/activity/activity_v4_20597_1452325598_focus.jpg@90Q",
                                  @"http://img01.bqstatic.com/upload/activity/activity_v4_20629_1452324053_focus.jpg@90Q",
                                  @"http://img01.bqstatic.com/upload/activity/activity_v4_20624_1452392276_focus.jpg@90Q",
                                  @"http://img01.bqstatic.com/upload/activity/activity_v4_20537_1452476149_focus.jpg@90Q"];
    
    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageURLStringsGroup:imagesURLString];
    
    
    [self addSubview:cycleScrollView];
    
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(120);
    }];
    
    _cycleScrollView = cycleScrollView;
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
}

#pragma mark - 添加四个按钮
- (void)addBtn{
    
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - btnWH * 4) / 5;
    
    //抽奖按钮
    UIButton * btnDraw = [self setBtnWithImageName:@"抽奖" title:@"抽奖"];
    
    [btnDraw mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_cycleScrollView.mas_bottom).offset(10);
        make.left.mas_equalTo(self).offset(margin);
    }];
    
    //秒杀按钮
    UIButton * btnSecKill = [self setBtnWithImageName:@"秒杀" title:@"秒杀"];
    
    [btnSecKill mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(btnDraw);
        make.left.mas_equalTo(btnDraw.mas_right).offset(margin);
    }];
    
    //抢红包按钮
    UIButton * btnRedBag = [self setBtnWithImageName:@"抢红包" title:@"抢红包"];
    
    [btnRedBag mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(btnSecKill);
        make.left.mas_equalTo(btnSecKill.mas_right).offset(margin);
    }];
    
    //蜂抱团按钮
    UIButton * btnBee = [self setBtnWithImageName:@"蜂抱团" title:@"蜂抱团"];
    
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

@end
