//
//  AFBMineTableViewCell.m
//  LoveFreshBee
//
//  Created by xlx on 16/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBMineTableViewCell.h"

@implementation AFBMineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

// 添加cell控件
- (void)setupUI
{
    // 添加图片
    UIImageView *iconView = [[UIImageView alloc] init];
    self.iconView = iconView;
    [self.contentView addSubview:iconView];
    // 添加lable
    UILabel *lb_title = [[UILabel alloc] init];
    lb_title.textColor = [UIColor darkGrayColor];
    lb_title.font = [UIFont systemFontOfSize:14];
    self.lb_title = lb_title;
    [self.contentView addSubview:lb_title];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(25);
    }];
    
    [lb_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
