//
//  AFBPriceArrangeControl.h
//  图文混排
//
//  Created by Adam on 2016/11/22.
//  Copyright © 2016年 YinY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFBOrderCommonControlBut.h"

@class AFBPriceArrangeControlText;

@interface AFBPriceArrangeControl :  AFBOrderCommonControlBut

@property(nonatomic, strong) AFBPriceArrangeControlText * textBar;
@property(nonatomic, assign) BOOL isUP; //设置一个属性保存价格的升降序

@end
