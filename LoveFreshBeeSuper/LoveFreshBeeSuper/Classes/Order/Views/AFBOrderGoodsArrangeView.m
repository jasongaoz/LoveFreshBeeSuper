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
#import "AFBPriceArrangeControlText.h"

@interface AFBOrderGoodsArrangeView ()

//标记选中的按钮
@property (nonatomic, weak) AFBOrderCommonControlBut *seletedBtn;

@end

@implementation AFBOrderGoodsArrangeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}




//通过点击了的按钮设置选中按钮,来修改各个按钮的状态
- (void)clickBtn:(AFBOrderCommonControlBut *)sender
{
    
    if (sender.arrangeType == ArrangeType_Price) {
        //取消上一个按钮的状态
        self.seletedBtn.selected = NO;
        self.seletedBtn.titleLable.textColor = [UIColor blackColor];
        //现在的按钮设置选中
        sender.selected = YES;
        //替换选中按钮
        self.seletedBtn = sender;
        self.priceBut.textBar.title.textColor = [UIColor orangeColor];
        self.priceBut.isUP = !self.priceBut.isUP;
        //根据升降序去设置图片
        if (self.priceBut.isUP) {
            self.priceBut.textBar.topImage = [UIImage imageNamed:@"control-up-red"];
            self.priceBut.textBar.bottomImage = [UIImage imageNamed:@"control-down"];
        }else{
            self.priceBut.textBar.topImage = [UIImage imageNamed:@"control-up"];
            self.priceBut.textBar.bottomImage = [UIImage imageNamed:@"control-down-red"];
        }
    }else{
        
        //点击的不是价格排序,初始化价格排序按钮
        self.priceBut.textBar.title.textColor = [UIColor blackColor];
        self.priceBut.textBar.topImage = [UIImage imageNamed:@"control-up"];
        self.priceBut.textBar.bottomImage = [UIImage imageNamed:@"control-down"];
        
        
        //取消上一个按钮的状态
        self.seletedBtn.selected = NO;
        self.seletedBtn.titleLable.textColor = [UIColor blackColor];
        
        //现在的按钮设置选中
        sender.selected = YES;
        //替换选中按钮
        self.seletedBtn = sender;
        self.seletedBtn.titleLable.textColor = [UIColor orangeColor];
        self.priceBut.isUP = NO;
    }
   
}


- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    
    AFBOrderCommonControlBut * noumBut = [[AFBOrderCommonControlBut alloc]initWithFrame:CGRectMake(0, 0, self.width/3, self.height)];
    noumBut.titleLable.text = @"综合排序";
    self.seletedBtn = noumBut;
    noumBut.titleLable.textColor = [UIColor orangeColor];
    noumBut.arrangeType = ArrangeType_Noum;
    self.noumBut = noumBut;
    [self addSubview:noumBut];
    
    AFBPriceArrangeControl * priceBut = [[AFBPriceArrangeControl alloc]initWithFrame:CGRectMake(self.width/3, 0, self.width/3, self.height)];
    priceBut.arrangeType = ArrangeType_Price;
    
    self.priceBut = priceBut;
    [self addSubview:priceBut];
    
    AFBOrderCommonControlBut * salesVolumeBut= [[AFBOrderCommonControlBut alloc]initWithFrame:CGRectMake(self.width/3*2, 0, self.width/3, self.height)];
    salesVolumeBut.titleLable.text = @"按销量";
    salesVolumeBut.arrangeType = ArrangeType_SalesVolume;
    self.salesVolumeBut = salesVolumeBut;
    [self addSubview:salesVolumeBut];
    
    //给but绑定事件,切换select状态
    [noumBut addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [priceBut addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [salesVolumeBut addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}


@end
