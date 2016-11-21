//
//  AFBAddressCell.m
//  AFBMineAddress
//
//  Created by drfgh on 16/11/20.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import "AFBAddressCell.h"
#import "Masonry.h"

@implementation AFBAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    //姓名
    UILabel *lb_name = [[UILabel alloc]init];
    self.lb_name = lb_name;
    lb_name.text = @"小胖子高智佳";
    lb_name.font = [UIFont systemFontOfSize:12];
//    lb_name.font = 12;
    [self.contentView addSubview:lb_name];
    
    //电话
    UILabel *lb_phone = [[UILabel alloc]init];
    self.lb_phone = lb_phone;
    lb_phone.font = [UIFont systemFontOfSize:12];
    lb_phone.text = @"1234567890";
    [self.contentView addSubview:lb_phone];
    
    //地址
    UILabel *lb_address = [[UILabel alloc]init];
    self.lb_address = lb_address;
    lb_address.font = [UIFont systemFontOfSize:12];
    lb_address.text = @"脑残市智县镇二傻镇向阳屯5438250";
    [self.contentView addSubview:lb_address];
    
    //右侧图片btn
    UIButton *btn_pic = [[UIButton alloc]init];
    self.btn_pic = btn_pic;
    [btn_pic setBackgroundImage:[UIImage imageNamed:@"address_edit_normal"] forState:UIControlStateNormal];
    [btn_pic setBackgroundImage:[UIImage imageNamed:@"address_edit_highlighted"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:btn_pic];
    
    //竖线
    UIImageView *img_lines = [[UIImageView alloc]init];
    self.img_lines = img_lines;
    img_lines.image = [UIImage imageNamed:@"UMS_comment_view_cell"];
    [self.contentView addSubview:img_lines];
    
    //设置约束
    //姓名
    [lb_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(15);
    }];
    
    //电话
    [lb_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(120);
        make.top.equalTo(lb_name);
    }];
    
    //地址
    [lb_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lb_name);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    //btn
    [btn_pic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-8);
        make.top.equalTo(lb_name);
        make.width.height.mas_equalTo(40);
    }];
    
    //竖线
    [img_lines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(6);
        make.bottom.equalTo(self.contentView).offset(-6);
        make.width.mas_equalTo(1);
        make.right.equalTo(btn_pic.mas_left).offset(-6);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
