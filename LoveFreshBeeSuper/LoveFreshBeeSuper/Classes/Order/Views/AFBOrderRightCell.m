//
//  AFBOrderRightCell.m
//  LoveFreshBee
//
//  Created by Colbert Zhan on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderRightCell.h"
#import "AFBOrderIncreaseAndReduceView.h"
#import <UIImageView+WebCache.h>
#import "AFBCommonGoodsModel.h"

@interface AFBOrderRightCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *specificsLabel;
@property (weak, nonatomic) IBOutlet UILabel *partnerPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *marketPriceLabel;

@end

@implementation AFBOrderRightCell

- (void)setDataModel:(AFBCommonGoodsModel *)dataModel{
    _dataModel = dataModel;
    self.nameLabel.text = dataModel.name;
    self.specificsLabel.text = dataModel.specifics;
    self.partnerPriceLabel.text = dataModel.partner_price;
//    self.marketPriceLabel.text = dataModel.market_price;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:dataModel.img]];
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:dataModel.market_price attributes:attribtDic];
    
    self.marketPriceLabel.attributedText = attribtStr;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

//加载添加和减少购物数量的view
- (void)setupUI{
    AFBOrderIncreaseAndReduceView *increaseAndReduceView = [[[UINib nibWithNibName:@"AFBOrderIncreaseAndReduceView" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
    
    [self.contentView addSubview:increaseAndReduceView];
    
    //increaseAndReduceView的布局size
    CGSize size = increaseAndReduceView.bounds.size;
    [increaseAndReduceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.right.bottom.equalTo(self).offset(-8);
    }];
    
    //MARK:设置label的加粗
//    [self.nameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    [self.partnerPriceLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    
}

//让label在被选中状态背景颜色不变
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.contentView.backgroundColor = [UIColor whiteColor];
}

//让label在高亮状态背景颜色不变
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:YES];
    self.contentView.backgroundColor = [UIColor whiteColor];
}
@end
