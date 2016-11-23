//
//  AFBNavigationBarView.h
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AFBNavigationBarViewDelegate <NSObject>

- (void)clickLeftButton;
- (void)clickRightButton;

@end


@interface AFBNavigationBarView : UIView

@property (nonatomic,assign) CGFloat alpth;

@property(nonatomic,weak)UIView *rightView;

@property (nonatomic,weak) id <AFBNavigationBarViewDelegate> delegate;

@end
