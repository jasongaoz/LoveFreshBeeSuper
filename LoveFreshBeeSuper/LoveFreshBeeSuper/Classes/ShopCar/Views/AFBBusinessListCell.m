//
//  AFBBusinessListCell.m
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBBusinessListCell.h"

@interface AFBBusinessListCell ()

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
    [self addSubview:selBtn];
    [selBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [selBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    
    //商品图
    UIImageView *saleImage = [[UIImageView alloc] init];
    saleImage.image = [UIImage imageNamed:@""];
    [self addSubview:saleImage];
    
    //精选按钮
    UILabel *stusLabel = [[UILabel alloc] init];
    [self addSubview:stusLabel];
    
    //商品名称
    UILabel *nameLabel = [[UILabel alloc] init];
    [self addSubview:nameLabel];
    
    //商品价钱
    UILabel *priceLabel = [[UILabel alloc] init];
    [self addSubview:priceLabel];
    
    //布局
    [selBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [saleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
    }];
    
    [stusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
    }];
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
