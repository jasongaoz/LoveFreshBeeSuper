//
//  AFBPriceArrangeControlText.m
//  图文混排
//
//  Created by Adam on 2016/11/22.
//  Copyright © 2016年 YinY. All rights reserved.
//

#import "AFBPriceArrangeControlText.h"

@interface AFBPriceArrangeControlText ()
@property (weak, nonatomic) IBOutlet UIImageView *topImangeView;

@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@end

@implementation AFBPriceArrangeControlText

- (void)setTopImage:(UIImage *)topImage{
    _topImage = topImage;
    self.topImangeView.image = topImage;
}

- (void)setBottomImage:(UIImage *)bottomImage{
    _bottomImage = bottomImage;
    self.bottomImageView.image = bottomImage;
}

@end
