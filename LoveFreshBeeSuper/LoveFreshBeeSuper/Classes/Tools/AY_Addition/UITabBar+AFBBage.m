//
//  UITabBar+AFBBage.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "UITabBar+AFBBage.h"
#define TabbarItemNums 4.0    //tabbar的数量
static UILabel *_label;

@implementation UITabBar (AFBBage)
- (void)showBadgeOnItemIndex:(int)index withBadge:(NSString *)badge{
    if (!_label) {
        //移除之前的小红点
        [self removeBadgeOnItemIndex:index];
        //新建小红点
        UILabel *badgeView = [[UILabel alloc]init];
        badgeView.tag = index;
        badgeView.layer.cornerRadius = 7;
        badgeView.layer.masksToBounds = YES;
        badgeView.backgroundColor = [UIColor redColor];
        badgeView.textColor = [UIColor whiteColor];
        CGRect tabFrame = self.frame;
        _label = badgeView;
        
        //确定小红点的位置
        float percentX = (index +0.6) / TabbarItemNums;
        CGFloat x = ceilf(percentX * tabFrame.size.width);
        CGFloat y = ceilf(0.1 * tabFrame.size.height);
        badgeView.frame = CGRectMake(x, y, 15, 15);
        badgeView.font = [UIFont boldSystemFontOfSize:11];
        badgeView.textAlignment = UITextAlignmentCenter;
        [self addSubview:badgeView];
    }
    
    
    //赋值
    _label.text = badge;
    //动画
    _label.transform = CGAffineTransformMakeScale(1.5, 1.5);
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        _label.transform = CGAffineTransformIdentity;
    } completion:nil];
    
}
- (void)hideBadgeOnItemIndex:(int)index{
    
    //移除小红点
    [self removeBadgeOnItemIndex:index];
    
}

- (void)removeBadgeOnItemIndex:(int)index{
    
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        
        if (subView.tag == 888+index) {
            
            [subView removeFromSuperview];
            
        }
    }
}

@end
