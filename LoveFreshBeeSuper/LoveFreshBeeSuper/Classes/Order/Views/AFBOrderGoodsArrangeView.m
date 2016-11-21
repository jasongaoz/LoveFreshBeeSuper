//
//  AFBGoodsArrangeView.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderGoodsArrangeView.h"


@implementation AFBOrderGoodsArrangeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    NSMutableArray *Controls = [NSMutableArray array];

    for (NSInteger i = 0; i < 3; i++) {
        UIControl * arrangeControl = [self addControlWithTitle:[NSString stringWithFormat:@"我来了%zd",i] image:nil ArrangeType:(NSInteger )i];
        [self addSubview:arrangeControl];
        [Controls addObject:arrangeControl];

    }

    [Controls mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [Controls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(self);
    }];
   
}

- (UIControl *)addControlWithTitle:(NSString *)title image:(NSString *)image ArrangeType:(NSInteger )arrangeType{
    
    UIControl * arrangeControl = [[UIControl alloc]init];
    arrangeControl.tag = arrangeType;
    UILabel * label = [UILabel ay_labelWithText:title color:[UIColor blackColor] font:14];
    label.center = arrangeControl.center;
    [arrangeControl addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(arrangeControl);
    }];
    label.textAlignment = NSTextAlignmentCenter;
    arrangeControl.backgroundColor = [UIColor ay_randomColor];
    if (arrangeType == 1) {
        UIImageView * topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        UIImageView * bottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [arrangeControl addSubview:topImageView];
        [arrangeControl addSubview:bottomImageView];
        
    }
    
    return arrangeControl;
}



@end
