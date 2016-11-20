//
//  AFBOrderSearchHeadView.m
//  LoveFreshBee
//
//  Created by Colbert Zhan on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderSearchHeadView.h"

@implementation AFBOrderSearchHeadView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_search"]];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftView addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(leftView);
        make.size.equalTo(leftView);
    }];
    
    _tf_searchKeyWord.leftView = leftView;
}

@end
