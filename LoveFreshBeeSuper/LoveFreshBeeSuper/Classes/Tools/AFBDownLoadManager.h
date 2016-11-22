//
//  AFBDownLoadManager.h
//  LoveFreshBee
//
//  Created by gao2015 on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFBDownLoadManager : NSObject

+ (instancetype)shareManager;



- (void)getHomeDataWithParameters:(NSNumber *)parameter CompleteBlock:(void(^)(NSDictionary *arrayH))completeBlock;

- (void)getHomeHotSaleDataParameters:(NSNumber *)parameter CompleteBlock:(void(^)(NSDictionary *dicH,NSString *reqid))completeBlock;
- (void)getLaunchDataWithBlock:(void(^)(NSDictionary * dic))completeBlock;

- (void)getSuperMarketDataWithParameters:(NSNumber *)parameter CompleteBlock:(void(^)(NSDictionary *dataDic))completeBlock;

- (void)getMineOrderDataWithcompleteBlock:(void(^)(NSArray *dataArray))completeBlock;
- (void)getMineCardDataWithconpleteBlock:(void(^)(NSArray *dataArray))completeBlock;
- (void)getMineSysmsgDataWithconpleteBlock:(void(^)(NSArray *dataArray))completeBlock;
- (void)getMineMessageDataWithconpleteBlock:(void(^)(NSArray *dataArray))completeBlock;
- (void)getMineAdressDataWithconpleteBlock:(void(^)(NSArray *dataArray))completeBlock;

//异步获取搜索出的数据
- (void)getSearchDataParameters:(NSNumber *)parameter CompleteBlock:(void(^)(NSDictionary *dicH))completeBlock;
//异步获取热门搜索的关键字数据
- (void)getSearchKeyWordParameters:(NSNumber *)parameter CompleteBlock:(void(^)(NSDictionary *dicH))completeBlock;

@end
