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

    UIButton * noumBut = [UIButton ay_textButton:@"综合排序" fontSize:13 normalColor:[UIColor blackColor] selectedColor:[UIColor orangeColor]];
    noumBut.frame = CGRectMake(0, 0, self.width/3, self.height);
    self.noumBut = noumBut;
    [self addSubview:noumBut];

    AFBPriceArrangeControl * priceBut = [[AFBPriceArrangeControl alloc]initWithFrame:CGRectMake(self.width/3, 0, self.width/3, self.height)];
    self.priceBut = priceBut;
    [self addSubview:priceBut];
    
    UIButton * salesVolumeBut= [UIButton ay_textButton:@"按销量" fontSize:13 normalColor:[UIColor blackColor] selectedColor:[UIColor orangeColor]];
    salesVolumeBut.frame = CGRectMake(self.width/3*2, 0, self.width/3, self.height);
    self.salesVolumeBut = salesVolumeBut;
    [self addSubview:salesVolumeBut];
      
}


@end
