//
//  AFBEditAddressCell.m
//  AFBMineAddress
//
//  Created by drfgh on 16/11/21.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import "AFBEditAddressCell.h"
#import "Masonry.h"

@interface AFBEditAddressCell()

@end
@implementation AFBEditAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setModel:(AFBEditAddressModel *)model{
    
    self.model = model;
}

- (void)setupUI{
    
    //联系人
    UILabel *lb_name = [[UILabel alloc]init];
    lb_name.text = @"联系人";
    [self.contentView addSubview:lb_name];
    
    UITextField *tf_name = [[UITextField alloc]init];
    self.tf_name = tf_name;
    tf_name.placeholder = @"收货人姓名";
    [self.contentView addSubview:tf_name];
    
    //手机号码
    UILabel *lb_phone = [[UILabel alloc]init];
    lb_phone.text = @"手机号码";
    [self.contentView addSubview:lb_phone];
    
    UITextField *tf_phone = [[UITextField alloc]init];
    tf_phone.placeholder = @"鲜蜂侠联系您的电话";
    [self.contentView addSubview:tf_phone];
    
    //所在城市
    UILabel *lb_city = [[UILabel alloc]init];
    lb_city.text = @"所在城市";
    [self.contentView addSubview:lb_city];
    
    UITextField *tf_city = [[UITextField alloc]init];
    self.tf_city = tf_city;
    tf_city.placeholder = @"请选择城市";
    [self.contentView addSubview:tf_city];
    
    //所在地区
    UILabel *lb_area = [[UILabel alloc]init];
    lb_area.text = @"所在地区";
    [self.contentView addSubview:lb_area];
    
    UITextField *tf_area = [[UITextField alloc]init];
    self.tf_area = tf_area;
    tf_area.placeholder = @"请选择你的住宅,大厦或学校";
    [self.contentView addSubview:tf_area];
    
    //详细地址
    UILabel *lb_address = [[UILabel alloc]init];
    lb_address.text = @"详细地址";
    [self.contentView addSubview:lb_address];
    
    UITextField *tf_address = [[UITextField alloc]init];
    self.tf_address = tf_address;
    tf_address.placeholder = @"请输入楼号门牌号等详细信息";
    [self.contentView addSubview:tf_address];
    
    //性别
    UIButton *btn_man = [[UIButton alloc]init];
    self.btn_man = btn_man;
    [btn_man setImage:[UIImage imageNamed:@"noselected"] forState:UIControlStateNormal];
//    [btn_man setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateHighlighted];
    [btn_man setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    [self.contentView addSubview:btn_man];
    UILabel *lb_man = [[UILabel alloc]init];
    lb_man.text = @"先生";
    [self.contentView addSubview:lb_man];
    
    UIButton *btn_woman = [[UIButton alloc]init];
    self.btn_woman = btn_woman;
    [btn_woman setImage:[UIImage imageNamed:@"noselected"] forState:UIControlStateNormal];
//    [btn_woman setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateHighlighted];
    [btn_woman setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    [self.contentView addSubview:btn_woman];
    UILabel *lb_woman = [[UILabel alloc]init];
    lb_woman.text = @"女士";
    [self.contentView addSubview:lb_woman];
//    NSLog(@"%zd",btn_man.state);
//  btn的选性别点击事件
    [btn_man addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn_woman addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    
//    btn_woman.selected = NO;
//    btn_man.selected = YES;
//    设置约束
//    联系人
//    [lb_name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(10);
//    }];
//    [tf_name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(80);
//        make.top.equalTo(lb_name);
//        make.right.equalTo(self.contentView).offset(-10);
//    }];
//    
//    //手机号码
//    [lb_phone mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(10);
//    }];
//    [tf_phone mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(80);
//        make.top.equalTo(lb_phone);
//        make.right.equalTo(self.contentView).offset(-10);
//    }];
//    
//    //所在城市
//    [lb_city mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(10);
//    }];
//    [tf_city mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(80);
//        make.top.equalTo(lb_city);
//        make.right.equalTo(self.contentView).offset(-10);
//    }];
//    
//    //所在地区
//    [lb_area mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(10);
//    }];
//    [tf_area mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(80);
//        make.top.equalTo(lb_area);
//        make.right.equalTo(self.contentView).offset(-10);
//    }];
//    
//    //详细地址
//    [lb_address mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(10);
//    }];
//    [tf_address mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(80);
//        make.top.equalTo(lb_address);
//        make.right.equalTo(self.contentView).offset(-10);
//    }];
    
    //性别
    [btn_man mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
//        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(60);
    }];
    [lb_man mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
//        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(btn_man.mas_right).offset(10);
    }];
    
    [btn_woman mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(lb_man.mas_right).offset(60);
    }];
    [lb_woman mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(btn_woman.mas_right).offset(10);
    }];
}
//  btn的选性别点击事件
- (void)select:(UIButton *)sender{
    if (sender == self.btn_man) {
        self.btn_man.selected = !self.btn_man.selected;
        if (self.btn_woman.selected == YES) {
            self.btn_woman.selected = !self.btn_woman.selected;
        }
        return;
    }
    else if (sender == self.btn_woman){
        self.btn_woman.selected = !self.btn_woman.selected;
        if (self.btn_man.selected == YES) {
            self.btn_man.selected = !self.btn_man.selected;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
