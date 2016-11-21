//
//  AFBHomeCollectionController.h
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AFBHomeCollectionControllerDelegate <NSObject>

- (void)pushDrawView;
- (void)pushSecKillView;
- (void)pushRedBagView;
- (void)pushBeeView;

@end

@interface AFBHomeCollectionController : UICollectionViewController

@property (nonatomic,weak) id <AFBHomeCollectionControllerDelegate> delegate;

@end
