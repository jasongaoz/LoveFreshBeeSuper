//
//  AFBOrderRigthGoodsModel.h
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFBCommonGoodsModel : NSObject

@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * brand_name;//品牌名称
@property(nonatomic, copy) NSString * img;//图片连接
@property(nonatomic, copy) NSString * specifics;//净含量
@property(nonatomic, copy) NSString * market_price;//原价
@property(nonatomic, copy) NSString * partner_price;//实际价格
@property(nonatomic, copy) NSNumber * product_id;//综合排序ID
@property(nonatomic, copy) NSNumber * number;//销量

@property(nonatomic, copy) NSNumber * store_nums;//库存


//购买数量
@property(nonatomic,assign)NSInteger buyCount;


@end
