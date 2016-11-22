//
//  AFBOrderCommonControlBut.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderCommonControlBut.h"

@implementation AFBOrderCommonControlBut

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _titleLable = [UILabel ay_labelWithText:@"" color:[UIColor blackColor] font:13];
    CGPoint titleTextCenter = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    _titleLable.center = titleTextCenter;
    _titleLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLable];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
 
}

@end
