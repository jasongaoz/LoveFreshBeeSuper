//
//  AFBOrderIncreaseAndReduceView.m
//  LoveFreshBee
//
//  Created by Colbert Zhan on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderIncreaseAndReduceView.h"

@interface AFBOrderIncreaseAndReduceView ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;

@end

@implementation AFBOrderIncreaseAndReduceView
- (IBAction)clickPlusBtn:(id)sender {
    _isPlus = YES;
    
    self.goodsCount++;
    
    //因为正常的传递需要 3层 : 加减VIew --->cell --->tableView ---> self,view
    // 转换成 相对于 keyWIndow
    //MARK:1.坐标转换
    
    //1.获取主窗口
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    //2.转换
    
    //self  将谁身上的点 -- > minusPlusView
    // point: view 身上的将要转换的这个点
    // toVIew: 转换到谁身上
//    _startP = [self convertPoint:sender.center toView:keyWindow];
    
    
//    NSLog(@"%@",NSStringFromCGPoint(_startP));
    
    
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
