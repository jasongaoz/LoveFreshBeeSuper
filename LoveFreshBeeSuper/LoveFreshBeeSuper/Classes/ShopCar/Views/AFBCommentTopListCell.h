//
//  AFBCommentTopListCell.h
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AFBCommentTopListCellDelegate <NSObject>

- (void)AFBCommentTopListCellWithButton:(UIButton *)btn;

@end

@interface AFBCommentTopListCell : UITableViewCell

@property(nonatomic,weak) id <AFBCommentTopListCellDelegate> delegate;

@end
