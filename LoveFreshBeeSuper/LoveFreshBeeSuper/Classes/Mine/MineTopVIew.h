//
//  MineTopVIew.h
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineTopVIew;


@protocol MineTopVIewDelegate <NSObject>

- (void)arrowOfMineTopVIewClicked;
- (void)button:(UIButton *)btn ofMineTopVIewClicked:(MineTopVIew *)topView;

@end

@interface MineTopVIew : UIView

+ (instancetype)creatTopViewWithFrame:(CGRect)frame;

@property (nonatomic, weak) id<MineTopVIewDelegate> delegate;


@end
