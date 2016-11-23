//
//  newsCell.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "NewsCell.h"
#import "CellView.h"
@interface NewsCell()<CellViewDelegate>


@end


@implementation NewsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupUI];
    }

    return self;
}

- (void)setupUI
{
    CGFloat topH = 50;
    UIView *top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, topH)];
    UITapGestureRecognizer *topTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topClicked)];
    [top addGestureRecognizer:topTap];
    [self.contentView addSubview:top];
    
    UILabel *myDingDanLbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, topH)];
    myDingDanLbl.text = @"我的订单";
    myDingDanLbl.textColor = AFBRGBCommonColor(50);
    myDingDanLbl.font = [UIFont systemFontOfSize:15];
    [top addSubview:myDingDanLbl];
    
    UIImageView *icon = [[UIImageView alloc] init];
    icon.image = [UIImage imageNamed:@"baidu_wallet_arrow_right"];
    [icon sizeToFit];
    icon.center = CGPointMake(kScreenWidth - 20, topH/2);
    [top addSubview:icon];
    
    CGFloat detailLblW = 200;
    CGFloat detailLblX = CGRectGetMidX(icon.frame) - 10 - detailLblW;
    UILabel *detailLbl = [[UILabel alloc] initWithFrame:CGRectMake(detailLblX, 0, detailLblW, topH)];
    detailLbl.text = @"查看全部订单";
    detailLbl.textColor = AFBRGBCommonColor(153);
    detailLbl.font = [UIFont systemFontOfSize:13];
    detailLbl.textAlignment = UITextAlignmentRight;
    [top addSubview:detailLbl];
    
    // 线
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, topH - 0.5, kScreenWidth, 0.5)];
    line.backgroundColor = AFBRGBCommonColor(224);
    [top addSubview:line];

    // 2. view
    CellView *viewBtns = [CellView setupTopViewWithImageStrings:@[@"icon_daifukuan", @"icon_daishouhuo", @"icon_daipingjia", @"icon_tuikuan"] andTitles:@[@"代付款", @"待收货", @"待评价", @"退款/售后"]];
    viewBtns.frame = CGRectMake(0, 50, kScreenWidth, 70);
    viewBtns.delegate = self;
    [self.contentView addSubview:viewBtns];
}


#pragma mark - 监听 我的订单 的点击

- (void)topClicked {    
    if ([_delegate respondsToSelector:@selector(topViewClicked:)]) {
        [_delegate topViewClicked:self];
    }
}
#pragma mark - 监听4个按钮的点击
- (void)btn:(UIButton *)btn ofTopView:(CellView *)topView
{

    if ([_delegate respondsToSelector:@selector(cellClicked:ofTopView:btn:)]) {
        [_delegate cellClicked:self ofTopView:topView btn:btn];
    }


}


@end
