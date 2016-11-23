//
//  AFBSharedBuyCar.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/23.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBShopCart.h"
#import "AFBCommonGoodsModel.h"

static AFBShopCart *_sharedShopCart = nil;

@implementation AFBShopCart

//MARK:判断购物车中是否有模型
- (BOOL)isContainModel:(AFBCommonGoodsModel *)model{
    __block BOOL isContain = NO;
    [_sharedShopCart.goodsList enumerateObjectsUsingBlock:^(AFBCommonGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.rangeID integerValue]==[model.rangeID integerValue]) {
            isContain = YES;
        }
    }];
    return isContain;
}

//对比返回Model
- (AFBCommonGoodsModel *)returnModel:(AFBCommonGoodsModel *)model{
    for (AFBCommonGoodsModel * obj in _sharedShopCart.goodsList) {
        if ([obj.rangeID integerValue] == [model.rangeID integerValue]) {
            return obj;
        }
    }
    return model;
}

//MARK:如果购物车中已经有相对应的商品,就用block回调模型;
- (void )modelIsContain:(AFBCommonGoodsModel *)model containModel:(void(^)(AFBCommonGoodsModel *containModel))completeBlock{
    [_sharedShopCart.goodsList enumerateObjectsUsingBlock:^(AFBCommonGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"%@------%@",obj.rangeID,model.rangeID);
        if ([obj.rangeID integerValue]==[model.rangeID integerValue]) {
            completeBlock(obj);
        }
    }];
}

//MARK:添加一个model到购物车
- (void)shopCartAddGoodsModel:(AFBCommonGoodsModel *)model{
    if ([_sharedShopCart isContainModel:model]) {
        [_sharedShopCart modelIsContain:model containModel:^(AFBCommonGoodsModel *containModel) {
            containModel.buyCount++;
            NSLog(@"%@---%zd",containModel,containModel.buyCount);
            return ;
        }];
    }else{
        [_sharedShopCart.goodsList addObject:model];
        model.buyCount = 1;
        NSLog(@"新添加了一个商品");
    }
}



//MARK:减少一个model
- (void)shopCartSubGoodsModel:(AFBCommonGoodsModel *)model{
    if ([_sharedShopCart isContainModel:model]) {
        [_sharedShopCart modelIsContain:model containModel:^(AFBCommonGoodsModel *containModel) {
            if (containModel.buyCount > 0) {
                containModel.buyCount--;
            }else{
                [_sharedShopCart.goodsList removeObject:containModel];
            }
            NSLog(@"%@---%zd",containModel,containModel.buyCount);
        }];
    }else{
        [_sharedShopCart.goodsList addObject:model];
        model.buyCount = 1;
        NSLog(@"新添加了一个商品");
    }
}




//MARK:打印购物车中的商品数量
- (void)shopCartShowGoodsList{

}

//MARK:购物车的单例获取方法
+ (instancetype)sharedShopCart {
    
    static dispatch_once_t  token;
    dispatch_once(&token, ^{
        if (_sharedShopCart == nil ) {
            _sharedShopCart = [[AFBShopCart alloc] init];
        }
    });
    return _sharedShopCart;
}

- (NSMutableArray *)goodsList {
    if (_goodsList==nil) {
        _goodsList = [[NSMutableArray alloc] init];
    }
    return _goodsList;
}

- (NSInteger)count {
    return self.goodsList.count;
}


@end
