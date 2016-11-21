//
//  AFBAddressCell.h
//  AFBMineAddress
//
//  Created by drfgh on 16/11/20.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFBAddressCell : UITableViewCell
//姓名
@property (nonatomic,weak) UILabel *lb_name;
//电话号码
@property (nonatomic,weak) UILabel *lb_phone;
//地址
@property (nonatomic,weak) UILabel *lb_address;
//图片
@property (nonatomic,weak) UIButton *btn_pic;
//数线
@property (nonatomic,weak) UIImageView *img_lines;

//model

@end
