//
//  AFBOrderLeftModel.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderLeftModel.h"

@implementation AFBOrderLeftModel

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key ];
    if ([key  isEqual: @"id"]) {
        [super setValue:value forKey:@"idKey"];
    }
}

@end
