//
//  AFBHomeFirstCell.m
//  LoveFreshBeeSuper
//
//  Created by 王志华 on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeFirstCell.h"

typedef enum : NSUInteger {
    kBtnDraw = 1,
    KBtnSecKill = 2,
    kBtnRedBag = 3,
    kBtnBee = 4
} kBtnState;

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
    
    [self.contentView addSubview:cycleScrollView];
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(120);
    }];
    _cycleScrollView = cycleScrollView;
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
}

#pragma mark - 添加四个按钮
- (void)addBtn{
 
    //抽奖按钮
    UIButton * btnDraw = [self setBtnWithImageURLString:@"http://img01.bqstatic.com/upload/activity/activity_v4_20206_1452163603_icon.jpg" title:@"抽奖"];
    btnDraw.tag = 1;
    [btnDraw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_cycleScrollView.mas_bottom);
        make.left.mas_equalTo(self.contentView).offset(([UIScreen mainScreen].bounds.size.width - btnDraw.frame.size.width * 4) / 5);
    }];
    [btnDraw addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //秒杀按钮
    UIButton * btnSecKill = [self setBtnWithImageURLString:@"http://img01.bqstatic.com/upload/activity/activity_v4_20333_1451871780_icon.jpg" title:@"秒杀"];
    btnSecKill.tag = 2;
    [btnSecKill mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btnDraw);
        make.left.mas_equalTo(btnDraw.mas_right).offset(([UIScreen mainScreen].bounds.size.width - btnDraw.frame.size.width * 4) / 5);
    }];
    [btnSecKill addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //抢红包按钮
    UIButton * btnRedBag = [self setBtnWithImageURLString:@"http://img01.bqstatic.com/upload/activity/activity_v4_20596_1452250014_icon.jpg" title:@"抢红包"];
    btnRedBag.tag = 3;
    [btnRedBag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btnSecKill);
        make.left.mas_equalTo(btnSecKill.mas_right).offset(([UIScreen mainScreen].bounds.size.width - btnDraw.frame.size.width * 4) / 5);
    }];
    [btnRedBag addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //蜂抱团按钮
    UIButton * btnBee = [self setBtnWithImageURLString:@"http://img01.bqstatic.com/upload/activity/activity_v4_20382_1451896099_icon.jpg" title:@"蜂抱团"];
    btnBee.tag = 4;
    [btnBee mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btnRedBag);
        make.left.mas_equalTo(btnRedBag.mas_right).offset(([UIScreen mainScreen].bounds.size.width - btnDraw.frame.size.width * 4) / 5);
    }];
    [btnBee addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 实现按钮的点击事件
- (void)clickBtn:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(willPushDrawView)] ||
        [_delegate respondsToSelector:@selector(willPushSecKillView)] ||
        [_delegate respondsToSelector:@selector(willPushRedBagView)] ||
        [_delegate respondsToSelector:@selector(willPushBeeView)]
        ) {
        
        switch (sender.tag) {
            case kBtnDraw:
                [_delegate willPushDrawView];
                break;
            case KBtnSecKill:
                [_delegate willPushSecKillView];
                break;
            case kBtnRedBag:
                [_delegate willPushRedBagView];
                break;
            case kBtnBee:
                [_delegate willPushBeeView];
                break;
            default:
                break;
        }
    }
}

#pragma mark - 创建按钮
- (UIButton *)setBtnWithImageURLString:(NSString *)imageName title:(NSString *)title{
    NSURL * url = [NSURL URLWithString:imageName];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    UIButton * btn = [[UIButton alloc] init];
    [btn setAttributedTitle:[NSAttributedString ay_imageTextWithImage:image imageW:69 imageH:47 title:title fontSize:13 titleColor:[UIColor blackColor] spacing:3] forState:UIControlStateNormal];
    btn.titleLabel.numberOfLines = 0;
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn sizeToFit];
    [self.contentView addSubview:btn];
    return btn;
}

@end
