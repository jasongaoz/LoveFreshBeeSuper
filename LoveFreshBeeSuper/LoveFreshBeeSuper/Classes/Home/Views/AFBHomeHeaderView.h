//
//  AFBHomeHeaderView.h
//  LoveFreshBee
//
//  Created by 王志华 on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
#import "AFBHeaderButtonModel.h"

@interface AFBHomeHeaderView : UIView

//@property (nonatomic,copy)NSString * image1stURLString;
//@property (nonatomic,copy)NSString * image2ndURLString;
//@property (nonatomic,copy)NSString * image3rdURLString;
//@property (nonatomic,copy)NSString * image4thURLString;
//@property (nonatomic,copy)NSString * image5thURLString;

@property (nonatomic,strong) AFBHeaderButtonModel * model;

@property (nonatomic,strong) UIImageView * icon;
@property (nonatomic,copy) NSString * title;

@end
