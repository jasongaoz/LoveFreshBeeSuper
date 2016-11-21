//
//  AFBEditAddressCell.h
//  AFBMineAddress
//
//  Created by drfgh on 16/11/21.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFBEditAddressModel.h"

@interface AFBEditAddressCell : UITableViewCell
//联系人
@property (nonatomic,weak) UITextField *tf_name;
//性别
@property (nonatomic,weak) UIButton *btn_man;
@property (nonatomic,weak) UIButton *btn_woman;
//手机号码
@property (nonatomic,weak) UITextField *tf_phone;
//所在城市
@property (nonatomic,weak) UITextField *tf_city;
//所在地区
@property (nonatomic,weak) UITextField *tf_area;
//详细地址
@property (nonatomic,weak) UITextField *tf_address;

//model
@property (nonatomic,strong) AFBEditAddressModel *model;
@end
