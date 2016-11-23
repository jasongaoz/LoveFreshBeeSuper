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

@interface AFBOrderGoodsArrangeView : UIView



@property(nonatomic, strong) AFBOrderCommonControlBut * noumBut;
@property(nonatomic, strong) AFBPriceArrangeControl * priceBut;
@property(nonatomic, strong) AFBOrderCommonControlBut * salesVolumeBut;

- (void)clickBtn:(AFBOrderCommonControlBut *)sender;

@end
