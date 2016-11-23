//
//  newsCell.h
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsCell;
@class CellView;

@protocol NewsCellDelegate <NSObject>

- (void)topViewClicked:(NewsCell *)topView;
- (void)cellClicked:(NewsCell *)cell ofTopView:(CellView *)topView btn:(UIButton *)btn;


@end

@interface NewsCell : UITableViewCell

@property (nonatomic, weak) id<NewsCellDelegate> delegate;

@end
