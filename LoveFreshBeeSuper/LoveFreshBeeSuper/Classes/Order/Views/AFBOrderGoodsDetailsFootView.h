//
//  AFBOrderGoodsDetailsFootView.h
//  LoveFreshBeeSuper
//
//  Created by Colbert Zhan on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFBOrderIncreaseAndReduceView.h"

@interface AFBOrderGoodsDetailsFootView : UIView<AFBOrderIncreaseAndReduceViewDelegate>

@property (nonatomic, weak)UIButton *favoriteBtn;
@property (nonatomic, weak)AFBOrderIncreaseAndReduceView *increaseAndReduceView;
@property (nonatomic, weak)UILabel *goodsCountLab;

@property(nonatomic, assign) NSInteger goodsCount;//商品个数


@end
