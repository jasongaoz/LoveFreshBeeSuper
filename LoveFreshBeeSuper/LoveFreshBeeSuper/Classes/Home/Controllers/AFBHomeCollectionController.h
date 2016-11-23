//
//  AFBHomeCollectionController.h
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@protocol AFBHomeCollectionControllerDelegate <NSObject>
//lichao
- (void)getAlpha:(CGFloat)alpha;

- (void)pushDrawView;
- (void)pushSecKillView;
- (void)pushRedBagView;
- (void)pushBeeView;

- (void)refreshStart;
- (void)refreshEnd;

@end

@interface AFBHomeCollectionController : UICollectionViewController

@property (nonatomic,weak) id <AFBHomeCollectionControllerDelegate> delegate;

@end
