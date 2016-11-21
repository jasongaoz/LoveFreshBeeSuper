//
//  AFBEditAddressModel.h
//  AFBMineAddress
//
//  Created by drfgh on 16/11/21.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFBEditAddressModel : NSObject
//联系人
@property (nonatomic,copy) NSString *name;
//手机号码
@property (nonatomic,copy) NSString *phone;
//所在城市
@property (nonatomic,copy) NSString *city;
//所在地区
@property (nonatomic,copy) NSString *area;
//详细地址
@property (nonatomic,copy) NSString *address;
@end
