//
//  AFBPriceArrangeControl.m
//  图文混排
//
//  Created by Adam on 2016/11/22.
//  Copyright © 2016年 YinY. All rights reserved.
//

#import "AFBPriceArrangeControl.h"
#import "AFBPriceArrangeControlText.h"
#import "Masonry.h"

@implementation AFBPriceArrangeControl

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
         _titleText = [[[UINib nibWithNibName:@"AFBPriceArrangeControlText" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
        [self setupUI];
         [self addSubview:_titleText];
    }
    return self;
}

- (void)setupUI{
   
    CGPoint titleTextCenter = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    _titleText.center = titleTextCenter;
   
}


@end
