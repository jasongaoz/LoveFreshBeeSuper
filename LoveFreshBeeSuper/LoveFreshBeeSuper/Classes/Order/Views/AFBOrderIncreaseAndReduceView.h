//
//  AFBOrderIncreaseAndReduceView.h
//  LoveFreshBee
//
//  Created by Colbert Zhan on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFBOrderIncreaseAndReduceView;
@protocol AFBOrderIncreaseAndReduceViewDelegate <NSObject>


@optional
- (void)minusPlusView:(AFBOrderIncreaseAndReduceView *)iarView withCount:(NSInteger)goodsCount;


@end

@interface AFBOrderIncreaseAndReduceView : UIView

@property (nonatomic, weak) id<AFBOrderIncreaseAndReduceViewDelegate >delegate;

+ (instancetype)orderIncreaseAndReduceView;

@property(nonatomic, assign) NSInteger goodsCount;//商品个数

@property(nonatomic, assign) BOOL isPlus;

@end
