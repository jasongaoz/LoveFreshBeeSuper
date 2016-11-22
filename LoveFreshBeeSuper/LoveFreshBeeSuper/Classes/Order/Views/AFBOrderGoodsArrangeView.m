//
//  AFBGoodsArrangeView.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderGoodsArrangeView.h"
#import "AFBOrderCommonControlBut.h"
#import "AFBPriceArrangeControl.h"


@implementation AFBOrderGoodsArrangeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    AFBOrderCommonControlBut * controlNoum = [[AFBOrderCommonControlBut alloc]initWithFrame:CGRectMake(0, 0, self.width/3, self.height)];
    controlNoum.titleLable.text = @"综合排序";
    [self addSubview:controlNoum];
    
    AFBPriceArrangeControl * controlPrice= [[AFBPriceArrangeControl alloc]initWithFrame:CGRectMake(self.width/3, 0, self.width/3, self.height)];
    [self addSubview:controlPrice];
    
    AFBOrderCommonControlBut * controlSalesVolume= [[AFBOrderCommonControlBut alloc]initWithFrame:CGRectMake(self.width/3*2, 0, self.width/3, self.height)];
    controlSalesVolume.titleLable.text = @"按销量";
    [self addSubview:controlSalesVolume];
      
}


@end
