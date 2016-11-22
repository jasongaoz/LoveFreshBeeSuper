//
//  UITabBar+AFBBage.h
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (AFBBage)
- (void)showBadgeOnItemIndex:(int)index withBadge:(NSString *)badge;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
