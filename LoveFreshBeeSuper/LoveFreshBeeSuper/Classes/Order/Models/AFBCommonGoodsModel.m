//
//  AFBOrderRigthGoodsModel.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBCommonGoodsModel.h"

@implementation AFBCommonGoodsModel

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        [super setValue:value forKey:@"rangeID"];
    }
}

//yymodel过滤key的方法
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"rangeID":@"id"};
}




@end
