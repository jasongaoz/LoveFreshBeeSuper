//
//  AFBHolderView.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHolderView.h"

@implementation AFBHolderView

+ (instancetype)creatHolderView
{
    
    return [[self alloc] initWithImage:@"pushlistview_up"];
}

- (instancetype)initWithImage:(NSString *)imageStr
{
    if (self = [super init]) {
        
        // 图片
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:imageStr];
        CGFloat width = 160;
        CGFloat imgViewWH = 60;
        CGFloat imgViewX = (width - imgViewWH)/2;
        imgView.frame = CGRectMake(imgViewX, 20, imgViewWH, imgViewWH);
        [self addSubview:imgView];
        
        // label
        UILabel * lb_showLab = [[UILabel alloc] init];
        lb_showLab.font = [UIFont systemFontOfSize:14];
        lb_showLab.text = @"~~并没有消息~~";
        lb_showLab.textAlignment = UITextAlignmentCenter;
        lb_showLab.frame = CGRectMake(0, CGRectGetMaxY(imgView.frame) + 20, width, 20);
        [self addSubview:lb_showLab];

        
    }
    return self;
}

@end
