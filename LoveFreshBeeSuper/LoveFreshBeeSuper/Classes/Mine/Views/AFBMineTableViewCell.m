//
//  AFBMineTableViewCell.m
//  LoveFreshBee
//
//  Created by xlx on 16/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBMineTableViewCell.h"
#import "Const.h"

@interface AFBMineTableViewCell()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *lb_title;

@end


@implementation AFBMineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
    
    // 分割线
    _line = [[UIView alloc] init];
    _line.backgroundColor = AFBRGBCommonColor(224);
    [self.contentView addSubview:_line];
    
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
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self);
        make.height.mas_equalTo(0.5);
        make.bottom.equalTo(self);
    }];
}


- (void)setModel:(MineModel *)model {
    _model = model;
    
    self.iconView.image = [UIImage imageNamed:model.iconStr];
    self.lb_title.text = model.titleStr;
}

@end
