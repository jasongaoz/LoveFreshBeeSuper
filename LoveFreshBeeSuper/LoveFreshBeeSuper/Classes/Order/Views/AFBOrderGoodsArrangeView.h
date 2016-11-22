//
//  AFBGoodsArrangeView.h
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFBOrderCommonControlBut;
@class AFBPriceArrangeControl;

@protocol AFBOrderGoodsArrangeViewDelegate <NSObject>

- (void)arrangeViewChangeSelectBtnColorWithBtn:(AFBOrderCommonControlBut *)btn;

@end

@interface AFBOrderGoodsArrangeView : UIView

@property(nonatomic, weak) id <AFBOrderGoodsArrangeViewDelegate> dalegate;

@property(nonatomic, strong) AFBOrderCommonControlBut * noumBut;
@property(nonatomic, strong) AFBPriceArrangeControl * priceBut;
@property(nonatomic, strong) AFBOrderCommonControlBut * salesVolumeBut;


@end
