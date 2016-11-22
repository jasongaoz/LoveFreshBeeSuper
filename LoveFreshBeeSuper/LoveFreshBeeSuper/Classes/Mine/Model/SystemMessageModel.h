//
//  SystemMessage.h
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemMessageModel : NSObject

@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, assign) BOOL isShowMore;
@property (nonatomic, copy) NSString *detailsText;

@end
