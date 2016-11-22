//
//  AFBMyCardCell.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBMyCardCell.h"
@interface AFBMyCardCell()

@property (nonatomic, strong) UIImageView *imgCard;


@end


@implementation AFBMyCardCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupUI];
    }
    return self;
}
// 添加子控件
- (void)setupUI
{
    _imgCard = [[UIImageView alloc] init];
    _imgCard.image = [UIImage imageNamed:@"cardcount"];
    [self.contentView addSubview:_imgCard];
    [_imgCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(5);
        make.bottom.right.equalTo(self.contentView).offset(-5);
    }];

}



@end
