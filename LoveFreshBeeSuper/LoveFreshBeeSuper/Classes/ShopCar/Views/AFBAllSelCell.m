//
//  AFBAllSelCell.m
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBAllSelCell.h"

@implementation AFBAllSelCell

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
//布局
- (void)setupUI{
    UIButton *selbtn = [[UIButton alloc] init];
    [selbtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [selbtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [self.contentView addSubview:selbtn];
    selbtn.backgroundColor = [UIColor redColor];
    
    UILabel *textL = [[UILabel alloc] init];
    textL.text = @"全选";
    textL.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:textL];
    
    UILabel *tPriceL = [[UILabel alloc] init];
    //假数据
    float pri = 10.5;
    tPriceL.text = [NSString stringWithFormat:@"共%.2f¥",pri];
    tPriceL.textColor = [UIColor redColor];
    tPriceL.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:tPriceL];
    
    UIButton *yellowSelBtn = [[UIButton alloc] init];
    //假数据
    float price = 0.0;
    [yellowSelBtn setTitle:@"选好了" forState:UIControlStateNormal];
    [yellowSelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    yellowSelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [yellowSelBtn  setTitle:[NSString stringWithFormat:@"满¥%f起送",price] forState:UIControlStateSelected];
    [yellowSelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//    yellowSelBtn setcolor
//    [yellowSelBtn  setTitle:[NSString stringWithFormat:@"满¥%f起送",price] forState:UIControlStateNormal];
//    [yellowSelBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    [yellowSelBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [self.contentView addSubview:yellowSelBtn];
    //布局
    [selbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(13);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [textL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(selbtn);
        make.left.equalTo(selbtn.mas_right).offset(13);
    }];
    
    [tPriceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(textL);
        make.left.equalTo(textL.mas_right).offset(13);
    }];
    
    [yellowSelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(100);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
