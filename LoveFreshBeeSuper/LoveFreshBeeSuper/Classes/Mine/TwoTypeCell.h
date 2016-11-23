//
//  TwoTypeCell.h
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TwoTypeCell;

@protocol TwoTypeCellDegate <NSObject>

- (void)cellWithView:(TwoTypeCell *)twoCell view:(UIControl *)samllView;

@end

@interface TwoTypeCell : UITableViewCell

@property (nonatomic, strong) UIControl *firstView;
@property (nonatomic, strong) UIControl *twoView;
@property (nonatomic, strong) UIControl *ThreeView;

@property (nonatomic, weak) id<TwoTypeCellDegate> delegate;


@end
