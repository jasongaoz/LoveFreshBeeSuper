//
//  AFBHomeFlowLayout.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeFlowLayout.h"

@implementation AFBHomeFlowLayout
- (void)prepareLayout{
    [super prepareLayout];
    
    self.minimumLineSpacing = 7;
    
    self.minimumInteritemSpacing = 7;
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.sectionInset = UIEdgeInsetsMake(0, 7, 20, 7);
    
}
@end
