//
//  AFBCommentTopListCell.m
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBCommentTopListCell.h"

@implementation AFBCommentTopListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSLog(@"%@",self.contentView.subviews[1]);
}
- (IBAction)btn_1:(UIButton *)sender {
//    NSLog(@"%@",sender.titleLabel.text);

    if ([_delegate respondsToSelector:@selector(AFBCommentTopListCellWithButton:)]) {
        [_delegate AFBCommentTopListCellWithButton:sender];
    }
    
}
- (IBAction)btn_2:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(AFBCommentTopListCellWithButton:)]) {
        [_delegate AFBCommentTopListCellWithButton:sender];
    }
}
- (IBAction)btn_3:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(AFBCommentTopListCellWithButton:)]) {
        [_delegate AFBCommentTopListCellWithButton:sender];
    }
}

- (IBAction)btn_4:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(AFBCommentTopListCellWithButton:)]) {
        [_delegate AFBCommentTopListCellWithButton:sender];
    }
}
- (IBAction)btn_5:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(AFBCommentTopListCellWithButton:)]) {
        [_delegate AFBCommentTopListCellWithButton:sender];
    }
}
- (IBAction)btn_6:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(AFBCommentTopListCellWithButton:)]) {
        [_delegate AFBCommentTopListCellWithButton:sender];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
