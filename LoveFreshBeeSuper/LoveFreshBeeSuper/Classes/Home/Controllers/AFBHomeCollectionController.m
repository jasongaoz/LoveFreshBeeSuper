//
//  AFBHomeCollectionController.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeCollectionController.h"
#import "AFBHomeFlowLayout.h"
#import "AFBHomeSecondCell.h"
#import "AFBHomeThreeCell.h"
#import "AFBDownLoadManager.h"
#import "AFBHomeSecondModel.h"

@interface AFBHomeCollectionController ()<UICollectionViewDelegateFlowLayout>

@end
static NSString *cellFrist = @"cellFrist";
static NSString *cellSecond = @"cellSecond";
static NSString *cellThree = @"cellThree";
static NSString *cell1 = @"cell";
@implementation AFBHomeCollectionController{
    NSArray *_modelList;
}
//重新init方法
- (instancetype)init{
    AFBHomeFlowLayout *layout = [[AFBHomeFlowLayout alloc]init];
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载数据
    [self loadData];
    self.collectionView.backgroundColor = [UIColor grayColor];
    //注册
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cell1];
    [self.collectionView registerClass:[AFBHomeThreeCell class] forCellWithReuseIdentifier:cellFrist];
    [self.collectionView registerClass:[AFBHomeSecondCell class] forCellWithReuseIdentifier:cellSecond];
    [self.collectionView registerClass:[AFBHomeThreeCell class] forCellWithReuseIdentifier:cellThree];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - loadData
- (void)loadData{
    AFBDownLoadManager *manager = [AFBDownLoadManager shareManager];

    [manager getHomeDataWithParameters:@1 CompleteBlock:^(NSArray *arrayH) {
        //字典转模型
//        NSDictionary *dic = arrayH[@"data"];
//        NSArray *array = dic[@"activities"];
//        _modelList = [NSArray yy_modelArrayWithClass:[AFBHomeSecondModel class] json:arrayH];
        NSLog(@"%@",arrayH);
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 30;
            break;
        case 3:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        AFBHomeSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellSecond forIndexPath:indexPath];
        AFBHomeSecondModel *model = _modelList[indexPath.row];
        
        return cell;
    }else if (indexPath.section == 2){
        AFBHomeSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellThree forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

#pragma mark - collectiondelegateflowlayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat wigth = self.view.bounds.size.width;
    
    if (indexPath.section == 0) {
        
        return CGSizeMake(wigth, 200);
        
    }else if (indexPath.section == 1){
        
        return CGSizeMake(wigth-14, 105);
        
    }else if (indexPath.section == 2){
        
        CGFloat wigth2 = (self.view.bounds.size.width-21)/2;
        CGFloat height = 189;
        return CGSizeMake(wigth2,height);
        
    }
    return CGSizeMake(wigth, 50);
}



#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
