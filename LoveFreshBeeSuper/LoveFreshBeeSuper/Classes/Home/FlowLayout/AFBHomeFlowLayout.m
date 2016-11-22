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
    
    self.minimumInteritemSpacing = 1;
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.sectionInset = UIEdgeInsetsMake(0, 0, 20, 0);
    
}
@end
