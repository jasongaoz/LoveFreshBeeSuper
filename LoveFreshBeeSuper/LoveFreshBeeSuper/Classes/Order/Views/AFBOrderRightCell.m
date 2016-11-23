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



@interface AFBOrderRightCell ()<AFBOrderIncreaseAndReduceViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *specificsLabel;
@property (weak, nonatomic) IBOutlet UILabel *partnerPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *marketPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotLabel;



@end

@implementation AFBOrderRightCell

- (void)setDataModel:(AFBCommonGoodsModel *)dataModel{
    _dataModel = dataModel;
    self.nameLabel.text = dataModel.name;
    self.specificsLabel.text = dataModel.specifics;
    self.partnerPriceLabel.text = [NSString stringWithFormat:@"¥%@",dataModel.partner_price];
//    self.marketPriceLabel.text = dataModel.market_price;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:dataModel.img]];
    //原价按钮中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",dataModel.market_price] attributes:attribtDic];
    
    self.marketPriceLabel.attributedText = attribtStr;
    [self.hotLabel.layer setBorderWidth:0.8];
    self.hotLabel.layer.borderColor = [UIColor redColor].CGColor;
    self.hotLabel.textColor = [UIColor redColor];
    self.hotLabel.layer.cornerRadius = 5;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

//实现加减View的代理方法
- (void)minusPlusView:(AFBOrderIncreaseAndReduceView *)iarView withCount:(NSInteger)goodsCount{
    
        //MARK:1.接收加减号的数量修改模型中的个数
        _dataModel.buyCount = goodsCount;
        
        
        if (iarView.isPlus) {//增加
            
            //MARK:2.通过代理 将cell的数据 传递给控制器
//            if([_delegate respondsToSelector:@selector(rightCell:withPlusModel:withStartPoint:)]){
//                
//                [_delegate rightCell:self withPlusModel:_model withStartPoint:minusV.startP];
//                
//                
//            }
            
        }else{
            
            //MARK:2.通过代理 将cell的数据 传递给控制器
//            if([_delegate respondsToSelector:@selector(rightCell:withMinusModel:)]){
//                
//                [_delegate rightCell:self withMinusModel:_model];
//                
//            }
            
        }

}

//加载添加和减少购物数量的view
- (void)setupUI{
    AFBOrderIncreaseAndReduceView *increaseAndReduceView = [AFBOrderIncreaseAndReduceView orderIncreaseAndReduceView];
    
    increaseAndReduceView.delegate = self;
    
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
