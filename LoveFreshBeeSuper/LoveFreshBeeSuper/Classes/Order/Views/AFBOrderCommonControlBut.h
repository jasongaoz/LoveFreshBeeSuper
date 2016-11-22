//
//  AFBOrderCommonControlBut.h
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

//排序模式
typedef enum {
    
    ArrangeType_Noum = 0,   //默认  //综合排序
    ArrangeType_Price = 1,    //按价格
    ArrangeType_SalesVolume = 2  //按销量
    
}ArrangeType;

@interface AFBOrderCommonControlBut : UIControl

@property(nonatomic, strong) UILabel * titleLable;

@property(nonatomic, assign) ArrangeType arrangeType;

@end
