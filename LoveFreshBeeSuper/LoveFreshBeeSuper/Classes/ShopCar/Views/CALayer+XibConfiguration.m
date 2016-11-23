//
//  CALayer+XibConfiguration.m
//  LoveFreshBeeSuper
//
//  Created by 王志华 on 2016/11/23.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer (XibConfiguration)

-(void)setBorderUIColor:(UIColor*)color{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderUIColor{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
