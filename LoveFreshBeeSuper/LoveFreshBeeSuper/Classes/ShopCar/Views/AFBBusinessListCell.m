//
//  AFBBusinessListCell.m
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBBusinessListCell.h"

@interface AFBBusinessListCell ()

@property(nonatomic,weak) UIImageView *saleImage;

@property(nonatomic,weak) UILabel *stusLabel;

@property(nonatomic,weak) UILabel *nameLabel;

@property(nonatomic,weak) UILabel *priceLabel;

@end

@implementation AFBBusinessListCell

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
    //选中按钮
    UIButton *selBtn = [[UIButton alloc] init];
    [selBtn setImage:[UIImage imageNamed:@"v2_noselecte"] forState:UIControlStateNormal];
    [self.contentView addSubview:selBtn];
//    [selBtn setImage:[UIImage imageNamed:@"v2_selecte"] forState:UIControlStateSelected];
    
    //商品图
    UIImageView *saleImage = [[UIImageView alloc] init];
    saleImage.image = [UIImage imageNamed:@"001.png"];
    [self.contentView addSubview:saleImage];
    
    //精选按钮
    UILabel *stusLabel = [[UILabel alloc] init];
    stusLabel.text = @"精选";
    stusLabel.textColor = [UIColor redColor];
     stusLabel.font = [UIFont systemFontOfSize:11];
    [stusLabel.layer setBorderWidth:0.5];
    stusLabel.layer.borderColor = [UIColor redColor].CGColor;
    stusLabel.layer.cornerRadius = 3;
    [self.contentView addSubview:stusLabel];
    
    //商品名称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"酱香寿司";
    nameLabel.font = [UIFont systemFontOfSize:12];

    
    [self.contentView addSubview:nameLabel];
    
    //商品价钱
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.text = @"¥115.1";
    priceLabel.font = [UIFont systemFontOfSize:13];
    priceLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:priceLabel];
    
    //布局
    [selBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(16);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [saleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(selBtn);
        make.left.equalTo(selBtn.mas_right).offset(13);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [stusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(saleImage.mas_right).offset(12);
        make.top.equalTo(self.contentView).offset(10);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(stusLabel.mas_right).offset(1);
        make.top.equalTo(stusLabel.mas_top);
    }];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(stusLabel.mas_left);
        make.bottom.equalTo(self.contentView).offset(-10);

    }];
    
}

- (void)setModel:(AFBShopCarBusinessModel *)model{
    _model = model;
    


}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
