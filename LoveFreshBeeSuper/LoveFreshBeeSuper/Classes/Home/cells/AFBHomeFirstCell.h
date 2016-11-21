//
//  AFBHomeFirstCell.h
//  LoveFreshBeeSuper
//
//  Created by 王志华 on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
#import <SDCycleScrollView.h>

@protocol AFBHomeFirstCellDelegate <NSObject>

- (void)willPushDrawView;
- (void)willPushSecKillView;
- (void)willPushRedBagView;
- (void)willPushBeeView;

@end

@interface AFBHomeFirstCell : UICollectionViewCell

@property (nonatomic,weak) id <AFBHomeFirstCellDelegate> delegate;

@end
