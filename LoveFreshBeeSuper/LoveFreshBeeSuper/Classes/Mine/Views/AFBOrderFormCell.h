//
//  AFBOrderFormCell.h
//  AFBOrderFormController
//
//  Created by drfgh on 16/11/19.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFBOrderFormModel.h"

@interface AFBOrderFormCell : UITableViewCell
//日期
@property (weak, nonatomic) IBOutlet UILabel *date;
//时间
@property (weak, nonatomic) IBOutlet UILabel *time;
//已完成
@property (nonatomic,weak) UILabel *finish;
//灰色分割线
@property (weak, nonatomic) IBOutlet UIView *linesOne;
@property (weak, nonatomic) IBOutlet UIView *linesTwo;
@property (weak, nonatomic) IBOutlet UIView *linesThree;
//图片
@property (weak, nonatomic) IBOutlet UIImageView *pic;
//点点点
@property (weak, nonatomic) IBOutlet UIImageView *point;
//箭头
@property (weak, nonatomic) IBOutlet UIButton *arrow;
//商品个数
@property (weak, nonatomic) IBOutlet UILabel *num;
//实付
@property (weak, nonatomic) IBOutlet UILabel *pay;
//金额
@property (weak, nonatomic) IBOutlet UILabel *money;
//发福利
@property (weak, nonatomic) IBOutlet UIButton *welfare;

//model
@property (nonatomic,strong) AFBOrderFormModel *model;
@end
