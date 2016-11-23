//
//  AFBHomeThreeModel.h
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface AFBHomeThreeModel : NSObject
@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *specifics;
@property(nonatomic,copy)NSString *market_price;
@property(nonatomic,copy)NSString *partner_price;
@property(nonatomic, copy) NSNumber * store_nums;//库存
@property(nonatomic, copy) NSNumber * number;//销量
@property(nonatomic, copy) NSNumber * product_id;//综合排序ID
@property(nonatomic, copy) NSString * brand_name;//品牌名称

//购买一个商品的个数。
@property(nonatomic,assign)NSInteger buyCount;

@end
