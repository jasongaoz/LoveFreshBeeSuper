//
//  AFBOrderFormModel.h
//  AFBOrderFormController
//
//  Created by drfgh on 16/11/20.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFBOrderFormModel : NSObject
//日期
@property (nonatomic,copy) NSString *date;
//时间
@property (nonatomic,copy) NSString *time;
//已完成
@property (nonatomic,copy) NSString *finish;
//商品个数
@property (nonatomic,copy) NSString *num;
//金额
@property (nonatomic,copy) NSString *money;
@end
