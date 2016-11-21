//
//  AFBCommentCell.m
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBCommentCell.h"

@implementation AFBCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    UILabel *comLabel = [[UILabel alloc] init];
    comLabel.text = @"备注";
    comLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:comLabel];
    
    UILabel *detalLabel = [[UILabel alloc] init];
    detalLabel.text = @"其他要求 (如带一盒红塔山)";
    detalLabel.font = [UIFont systemFontOfSize:12];
    detalLabel.numberOfLines = 1;
    detalLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:detalLabel];
    
    UIImageView *arrImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baidu_wallet_arrow_right"]];
    [self.contentView addSubview:arrImg];
    
    //布局
    [comLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(13);
    }];
    
    [arrImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-10);
    }];

    [detalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(arrImg);
        make.right.equalTo(arrImg.mas_left).offset(-8);
        
    }];
    
    
}

@end
