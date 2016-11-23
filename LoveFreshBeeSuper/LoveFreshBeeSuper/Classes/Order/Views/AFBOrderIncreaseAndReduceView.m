//
//  AFBOrderIncreaseAndReduceView.m
//  LoveFreshBee
//
//  Created by Colbert Zhan on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderIncreaseAndReduceView.h"
#import "AFBCommonGoodsModel.h"

@interface AFBOrderIncreaseAndReduceView ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;

@end


@implementation AFBOrderIncreaseAndReduceView

- (void)setModel:(AFBCommonGoodsModel *)model{
    _model = model;
//    if (model.buyCount == 0) {
//        self.subBtn.hidden = YES;
//        self.countLabel.hidden = YES;
//    }
    self.goodsCount = model.buyCount;
}

- (IBAction)clickPlusBtn:(id)sender {
    _isPlus = YES;
    
    _ShopCarAdd(self.model);
    self.goodsCount = self.model.buyCount;
    
    if([_delegate respondsToSelector:@selector(minusPlusView:withCount:)]){
        
        [_delegate minusPlusView:self withCount:self.goodsCount];
    }

}

- (void)setGoodsCount:(NSInteger)goodsCount{
    _goodsCount = goodsCount;

    //如果个数为0 隐藏 减号 和 数量Label
    _subBtn.hidden = (goodsCount == 0);
    _countLabel.hidden = (goodsCount == 0);
    
    //给label赋值
    _countLabel.text = @(goodsCount).description;

}

- (IBAction)clickSubBtn:(id)sender {
    _isPlus = NO;
    
    self.goodsCount--;
    _ShopCarSub(self.model);
    if([_delegate respondsToSelector:@selector(minusPlusView:withCount:)]){
        
        [_delegate minusPlusView:self withCount:self.goodsCount];
    }

}

+ (instancetype)orderIncreaseAndReduceView
{

    UINib *nib = [UINib nibWithNibName:@"AFBOrderIncreaseAndReduceView" bundle:nil];
    return [[nib instantiateWithOwner:nil options:nil] lastObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
