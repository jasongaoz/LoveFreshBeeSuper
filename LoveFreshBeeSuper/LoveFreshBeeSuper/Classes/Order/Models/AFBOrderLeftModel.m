//
//  AFBOrderLeftModel.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderLeftModel.h"


@implementation AFBOrderLeftModel

- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    
    //判断关键字的key
    if ([key isEqualToString:@"id"]) {
        
        //替换系统的key
        [super setValue:value forKey:@"idKey"];
    }
    
    
}

//yymodel过滤key的方法
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"idKey":@"id"};
}

@end
