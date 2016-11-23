//
//  TopView.h
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CellView;

@protocol CellViewDelegate <NSObject>

- (void)btn:(UIButton *)btn ofTopView:(CellView *)topView;

@end


@interface CellView : UIView

+ (instancetype)setupTopViewWithImageStrings:(NSArray *)imageStrings andTitles:(NSArray *)titles;

@property (nonatomic, weak) id<CellViewDelegate> delegate;


@end
