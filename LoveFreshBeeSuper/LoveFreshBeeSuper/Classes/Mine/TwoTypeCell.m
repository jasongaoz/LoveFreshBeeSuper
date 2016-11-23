//
//  TwoTypeCell.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "TwoTypeCell.h"
#import "AFBMineMyCardController.h"
@interface TwoTypeCell()




@end


@implementation TwoTypeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}
- (void)setupUI
{
    CGFloat lbW = 60;
    CGFloat margin = (kScreenWidth - lbW * 3)/4;

    UILabel *titleLb = [[UILabel alloc] init];
    titleLb.textColor = AFBRGBCommonColor(50);
    titleLb.font = [UIFont systemFontOfSize:15];
    titleLb.text = @"我的钱包";
    titleLb.frame =
    CGRectMake(25, 10, 70, 25);
    [self.contentView addSubview:titleLb];
    
    // 线
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = AFBRGBCommonColor(224);
    [self.contentView addSubview:line];
    line.frame = CGRectMake(0, 45, kScreenWidth, 0.5);

    CGFloat viewY = 53;
   // 第一个 firstView
    UIControl *firstView = [self getSmallViewWithBtnName:@"余额" countLb:10.0];
    self.firstView = firstView;
    firstView.tag = 1;
    firstView.frame = CGRectMake(margin - 10 ,viewY, lbW, lbW);
    [self.contentView addSubview:firstView];
    [firstView addTarget:self action:@selector(jumpMoney:) forControlEvents:UIControlEventTouchUpInside];
    
    // 第二个view
    UIControl *twoView = [self getSmallViewWithBtnName:@"优惠券" countLb:45];
    self.twoView = twoView;
        [twoView addTarget:self action:@selector(jumpMoney:) forControlEvents:UIControlEventTouchUpInside];
    twoView.tag = 2;
    twoView.frame = CGRectMake((margin * 2 + lbW),viewY, lbW, lbW);
    [self.contentView addSubview:twoView];
    
    // 第三个view
    UIControl *threeView = [self getSmallViewWithBtnName:@"积分" countLb:40];
    self.ThreeView = threeView;
    threeView.tag = 3;
    threeView.frame = CGRectMake((margin  + lbW) * 2 + margin + 10 ,viewY, lbW, lbW);
        [threeView addTarget:self action:@selector(jumpMoney:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:threeView];
}
- (void)jumpMoney:(UIControl *)sender
{

        if ([_delegate respondsToSelector:@selector(cellWithView:view:)])
        {
            [_delegate cellWithView:self view:sender];
        }
 
}
// 封装小UIControl
- (UIControl *)getSmallViewWithBtnName:(NSString *)name countLb:(CGFloat)count
{

    UIControl *backView = [[UIControl alloc] init];
    backView.frame = CGRectMake(0, 0, 60, 60);
    
    UILabel *countLb = [[UILabel alloc] init];
    countLb.textColor = [UIColor darkGrayColor];
    countLb.textAlignment = NSTextAlignmentCenter;
    countLb.text = @(count).description;
    countLb.frame = CGRectMake(5, 5, 45, 25);
    [backView addSubview:countLb];

    UILabel *btn = [[UILabel alloc] init];
    btn.textAlignment = NSTextAlignmentCenter;
    btn.font = [UIFont systemFontOfSize:13];
    btn.text = name;
    btn.textColor = [UIColor darkGrayColor];
    btn.frame = CGRectMake(5, 30, 50, 25);
    [backView addSubview:btn];
    
    return backView;

}

@end
