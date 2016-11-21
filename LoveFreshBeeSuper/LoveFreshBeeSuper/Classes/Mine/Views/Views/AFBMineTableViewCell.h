//
//  AFBMineTableViewCell.h
//  LoveFreshBee
//
//  Created by xlx on 16/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineModel.h"

@interface AFBMineTableViewCell : UITableViewCell

@property (nonatomic, strong) MineModel *model;

@property (nonatomic, strong) UIView *line;

@end
