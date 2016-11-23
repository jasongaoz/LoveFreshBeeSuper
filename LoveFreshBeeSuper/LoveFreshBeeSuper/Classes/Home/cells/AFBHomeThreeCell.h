//
//  AFBHomeThreeCell.h
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFBHomeThreeModel.h"
#import <UIImageView+WebCache.h>
@class AFBHomeThreeCell;

@protocol AFBHomeThreeCellDelegate <NSObject>

- (void)homeThreeCell:(AFBHomeThreeCell*)homeThreeCell withAddModel:(AFBHomeThreeModel *)Model withStartPoint:(CGPoint)startp;

@end
@interface AFBHomeThreeCell : UICollectionViewCell
@property(nonatomic,weak)UIImageView *imageView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UIImageView *selectView;
@property(nonatomic,weak)UIImageView *payView;
@property(nonatomic,weak)UILabel *countLabel;
@property(nonatomic,weak)UILabel *partner_price;
@property(nonatomic,weak)UILabel *market_price;

@property(nonatomic,strong)AFBHomeThreeModel *model;
//动画开始起点
@property(nonatomic,assign)CGPoint startP;
@property(nonatomic,weak)id<AFBHomeThreeCellDelegate> delegate;

@end
