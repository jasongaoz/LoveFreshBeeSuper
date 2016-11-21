//
//  TopView.h
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopView;

@protocol TopViewDelegate <NSObject>

- (void)btn:(UIButton *)btn ofTopView:(TopView *)topView;

@end


@interface TopView : UIView

+ (instancetype)setupTopViewWithImageStrings:(NSArray *)imageStrings andTitles:(NSArray *)titles;

@property (nonatomic, weak) id<TopViewDelegate> delegate;


@end
