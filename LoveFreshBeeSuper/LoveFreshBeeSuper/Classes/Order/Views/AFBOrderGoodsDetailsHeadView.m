//
//  AFBOrderGoodsDetail.m
//  LoveFreshBeeSuper
//
//  Created by Colbert Zhan on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderGoodsDetailsHeadView.h"
#import <UIImageView+WebCache.h>

@interface AFBOrderGoodsDetailsHeadView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *specificsLabel;
@property (weak, nonatomic) IBOutlet UILabel *partnerPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *marketPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *brandNameLable;

@end

@implementation AFBOrderGoodsDetailsHeadView

- (void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)setModel:(AFBCommonGoodsModel *)model{
    _model = model;
    self.nameLable.text = model.name;
    self.specificsLabel.text = model.specifics;
    self.partnerPriceLabel.text = [NSString stringWithFormat:@"¥%@",model.partner_price];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    NSString *market_price = [NSString stringWithFormat:@"¥%@",model.market_price];
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:market_price attributes:attribtDic];
    
    self.marketPriceLabel.attributedText = attribtStr;
    self.brandNameLable.text = model.brand_name;
}


@end
