//
//  MineTopVIew.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "MineTopVIew.h"

@implementation MineTopVIew

+ (instancetype)creatTopViewWithFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 添加子控件

        // 1. 添加背景图片
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
        imageView.image = [UIImage imageNamed:@"v2_my_avatar_bg"];
        [self addSubview:imageView];
        
        
        CGFloat bottomViewH = 35;
        CGFloat bottomViewY = frame.size.height - bottomViewH;
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, bottomViewY, kScreenWidth, bottomViewH)];
        bottomView.backgroundColor = AFBRGBColor(223, 182, 59);
        [self addSubview:bottomView];
        
        
        
        //2.1 创建个人头像
        CGFloat cicleViewWH = 60;
        CGFloat cicleViewY = (frame.size.height - bottomViewH - cicleViewWH)/2;
        CGFloat marginX = 15;
        UIImageView *cicleView = [[UIImageView alloc] initWithFrame:CGRectMake(marginX, cicleViewY, cicleViewWH, cicleViewWH)];
        cicleView.backgroundColor = [UIColor whiteColor];
        cicleView.contentMode = UIViewContentModeCenter;
        cicleView.layer.cornerRadius = cicleViewWH/2;
        cicleView.image = [UIImage imageNamed:@"v2_my"];
        [self addSubview:cicleView];
       
        
        //2.2 添加一个电话lebel
        CGFloat phoneLblX = CGRectGetMaxX(cicleView.frame) + marginX;
        CGFloat phoneLblW = kScreenWidth - phoneLblX - marginX;
        CGFloat phoneLblH = 20;
        UILabel *phoneLbl = [[UILabel alloc] initWithFrame:CGRectMake(phoneLblX, cicleViewY, phoneLblW, phoneLblH)];
        phoneLbl.text = @"18910328555";
        phoneLbl.font = [UIFont boldSystemFontOfSize:16];
        phoneLbl.textColor = [UIColor whiteColor];
        [self addSubview:phoneLbl];
        
        // 2.3 注册会员
        CGFloat beeImgW = 84;
        CGFloat beeImgH = 28;
        CGFloat beeImgX = phoneLblX;
        CGFloat beeImgY = CGRectGetMaxY(phoneLbl.frame) + 12;
        UIImageView *beeImg = [[UIImageView alloc] initWithFrame:CGRectMake(beeImgX, beeImgY, beeImgW, beeImgH)];
        beeImg.image = [UIImage imageNamed:@"icon_member"];
        [self addSubview:beeImg];
        
        CGFloat registionLbX = 25;
        CGFloat registionLbW = beeImgW - registionLbX;
        UILabel *registionLb = [[UILabel alloc] initWithFrame:CGRectMake(registionLbX, 0, registionLbW, beeImgH)];
        registionLb.font = [UIFont systemFontOfSize:14];
        registionLb.textColor = [UIColor redColor];
        registionLb.text = @"注册会员";
        [beeImg addSubview:registionLb];
        
        
        // 箭头
        CGFloat arrowViewXW = kScreenWidth/2;
        CGFloat arrowViewH = self.frame.size.height - bottomViewH;
        UIView *arrowView = [[UIView alloc] initWithFrame:CGRectMake(arrowViewXW, 0, arrowViewXW, arrowViewH)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(arrowViewCliked)];
        [arrowView addGestureRecognizer:tap];
        [self addSubview:arrowView];
        
        UIImageView *imageArrow = [[UIImageView alloc] init];
        imageArrow.image = [UIImage imageNamed:@"icon_white_arrow"];
        [imageArrow sizeToFit];
        CGFloat arrowW = 10.5;
        CGFloat imageArrowCenterX = arrowViewXW - (marginX + arrowW/2.0);
        CGFloat imageArrowCenterY = (frame.size.height - bottomViewH)/2;
        imageArrow.center = CGPointMake(imageArrowCenterX, imageArrowCenterY);
        [arrowView addSubview:imageArrow];

        //3.2 创建两个按钮
        // 商品收藏
        UIButton *btnGoodsSave = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, bottomViewH)];
        [btnGoodsSave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btnGoodsSave.titleLabel.font = [UIFont systemFontOfSize:11];
        [btnGoodsSave setImage:[UIImage imageNamed:@"v2_my_goodsCollection"] forState:UIControlStateNormal];
        [btnGoodsSave setTitle:@"商品收藏" forState:UIControlStateNormal];
        // 调整 图片 文字 的间距
        btnGoodsSave.imageEdgeInsets = UIEdgeInsetsMake(0, -12, 0, 0);
        btnGoodsSave.tag = 1;
        [btnGoodsSave addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:btnGoodsSave];
        
        // 店铺收藏
        UIButton *btnHomeSave = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth/2, 0, kScreenWidth/2, bottomViewH)];
        [btnHomeSave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btnHomeSave.titleLabel.font = [UIFont systemFontOfSize:11];
        [btnHomeSave setImage:[UIImage imageNamed:@"v2_my_storeCollection"] forState:UIControlStateNormal];
        [btnHomeSave setTitle:@"店铺收藏" forState:UIControlStateNormal];
        // 调整 图片 文字 的间距
        btnHomeSave.imageEdgeInsets = UIEdgeInsetsMake(0, -12, 0, 0);
        btnHomeSave.tag = 2;
        [btnHomeSave addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:btnHomeSave];
        
        CGFloat lineY = 10;
        CGFloat lineH = bottomViewH - 2*lineY;
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth/2, lineY, 0.5, lineH)];
        line.backgroundColor = [UIColor whiteColor];
        [bottomView addSubview:line];
    }

    return self;
}


#pragma mark - 点击箭头

- (void)arrowViewCliked {
    if ([_delegate respondsToSelector:@selector(arrowOfMineTopVIewClicked)]) {
        [_delegate arrowOfMineTopVIewClicked];
    }
    
}

#pragma mark - 监听按钮点击

- (void)buttonClicked:(UIButton *)btn {
    if (btn.tag == 1)
    {
        if ([_delegate respondsToSelector:@selector(button:ofMineTopVIewClicked:)]) {
            [_delegate button:btn ofMineTopVIewClicked:self];
        }
    }
    else
    {
        if ([_delegate respondsToSelector:@selector(button:ofMineTopVIewClicked:)]) {
            [_delegate button:btn ofMineTopVIewClicked:self];
        }
    }
 
}


@end
