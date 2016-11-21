//
//  AFBOrderFormCell.m
//  AFBOrderFormController
//
//  Created by drfgh on 16/11/19.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import "AFBOrderFormCell.h"
#import "Masonry.h"

@implementation AFBOrderFormCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setModel:(AFBOrderFormModel *)model{
    
    self.date.text = model.date;
    self.time.text = model.time;
//    self.pic.image = model.;
//    self.point = model.;
    self.num.text = model.num;
    self.money.text = model.money;

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self getupUI];
    }
    return self;
}

- (void)getupUI{
    
    //日期
    UILabel *date = [[UILabel alloc]init];
    self.date = date;
    date.text = @"1234-56-78";
    [self.contentView addSubview:date];
    
    [date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(6);
    }];
    
    //时间
    UILabel *time = [[UILabel alloc]init];
    self.time = time;
    time.text = @"12:34:56";
    [self.contentView addSubview:time];
    
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(date.mas_top);
        make.left.equalTo(date.mas_right).offset(6);
    }];
    
    //已完成
    UILabel *finish = [[UILabel alloc]init];
    self.finish = finish;
    finish.text = @"已完成";
    finish.textColor = [UIColor redColor];
    [self.contentView addSubview:finish];
    
    [finish mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(date);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    //灰色分割线
    UIImageView *linesOne = [[UIImageView alloc]init];
    self.linesOne = linesOne;
//    linesOne.backgroundColor = [UIColor grayColor];
    linesOne.image = [UIImage imageNamed:@"bj"];
    [self.contentView addSubview:linesOne];
    
    [linesOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(date.mas_bottom).offset(6);
        make.left.equalTo(self.contentView).offset(4);
        make.right.equalTo(self.contentView).offset(-4);
        make.height.mas_equalTo(1);
    }];

    //图片
    UIImageView *pic = [[UIImageView alloc]init];
    self.pic = pic;
    pic.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:pic];
    
    [pic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.top.equalTo(linesOne.mas_bottom).offset(8);
        make.size.height.mas_offset(60);
        make.size.width.mas_offset(60);
    }];
    
    //点点点
    UIImageView *point = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"goodmore"]];
    self.point = point;
    [self.contentView addSubview:point];
    
    [point mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pic);
        make.left.equalTo(pic.mas_right).offset(8);
    }];
    
    //箭头
    UIButton *arrow = [[UIButton alloc]init];
    self.arrow = arrow;
    [arrow setBackgroundImage:[UIImage imageNamed:@"icon_go"] forState:UIControlStateNormal];
    [self.contentView addSubview:arrow];
    
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10,20));
        make.centerY.equalTo(pic);
        make.right.equalTo(self.contentView).offset(-8);
        
    }];
    
    //第二个灰色分割线
    UIImageView *linesTwo = [[UIImageView alloc]init];
    self.linesTwo = linesTwo;
//    linesTwo.backgroundColor = [UIColor grayColor];
    linesTwo.image = [UIImage imageNamed:@"bj"];
    [self.contentView addSubview:linesTwo];
    
    [linesTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pic.mas_bottom).offset(6);
        make.left.equalTo(self.contentView).offset(4);
        make.right.equalTo(self.contentView).offset(-4);
        make.height.mas_equalTo(1);
    }];
    
    //金额
    UILabel *money = [[UILabel alloc]init];
    self.money = money;
    money.text =@"¥88.88";
    [self.contentView addSubview:money];
    
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(linesTwo.mas_bottom).offset(6);
        make.right.equalTo(self.contentView).offset(-8);
//        make.width.mas_equalTo(80);
    }];
    
    //实付
    UILabel *pay = [[UILabel alloc]init];
    self.pay = pay;
    pay.text = @"实付:";
    [self.contentView addSubview:pay];
    
    [pay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(money.mas_top);
        make.right.equalTo(money.mas_left).offset(-6);
    }];
    
    //商品个数
    UILabel *num = [[UILabel alloc]init];
    self.num = num;
    num.text = @"共8件商品";
    [self.contentView addSubview:num];
    
    [num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(money.mas_top);
        make.right.equalTo(pay.mas_left).offset(-6);
    }];

    //第三个灰色分割线
    UIImageView *linesThree = [[UIImageView alloc]init];
    self.linesThree = linesThree;
//    linesThree.backgroundColor = [UIColor grayColor];
    linesThree.image = [UIImage imageNamed:@"bj"];
    [self.contentView addSubview:linesThree];
    
    [linesThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(money.mas_bottom).offset(6);
        //        make.bottom.equalTo(welfare.mas_top).offset(10);
        make.left.equalTo(self.contentView).offset(4);
        make.right.equalTo(self.contentView).offset(-4);
        make.height.mas_equalTo(1);
    }];
    
    //发福利
    UIButton *welfare = [[UIButton alloc]init];
    welfare.layer.cornerRadius = 5;
    self.welfare = welfare;
//    welfare.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"coupon_verify_selected"]];
    [welfare setBackgroundImage:[UIImage imageNamed:@"coupon_verify_selected"] forState:UIControlStateNormal];
    [welfare setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [welfare setTitle:@"发福利" forState:UIControlStateNormal];
    [self.contentView addSubview:welfare];

    [welfare mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(linesThree.mas_bottom).offset(6);
        make.top.equalTo(linesThree).offset(6);
        make.right.equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
