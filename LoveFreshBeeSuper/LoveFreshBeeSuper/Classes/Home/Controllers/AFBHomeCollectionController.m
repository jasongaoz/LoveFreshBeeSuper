//
//  AFBHomeCollectionController.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHomeCollectionController.h"
#import "AFBHomeFlowLayout.h"
#import "AFBHomeFirstCell.h"
#import "AFBHomeSecondCell.h"
#import "AFBHomeThreeCell.h"
#import "AFBDownLoadManager.h"
#import "AFBHomeSecondModel.h"
#import "AFBHomeThreeModel.h"
#import "AFBHomeFourCell.h"

@interface AFBHomeCollectionController ()<UICollectionViewDelegateFlowLayout,AFBHomeFirstCellDelegate>

@end
static NSString *cellFrist = @"cellFrist";
static NSString *cellSecond = @"cellSecond";
static NSString *cellThree = @"cellThree";
static NSString *cellFour = @"cellFour";
@implementation AFBHomeCollectionController{
    NSArray *_btnList;
    NSArray *_modelList;
    NSArray *_threeModelList;
}
//重新init方法
- (instancetype)init{
    AFBHomeFlowLayout *layout = [[AFBHomeFlowLayout alloc]init];
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置collectionview的item穿透状态栏
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.offset(-20);
    }];
    // 加载数据
    [self loadData];
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    //注册
    [self.collectionView registerClass:[AFBHomeFourCell class] forCellWithReuseIdentifier:cellFour];
    [self.collectionView registerClass:[AFBHomeFirstCell class] forCellWithReuseIdentifier:cellFrist];
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

    [manager getHomeDataWithParameters:@1 CompleteBlock:^(NSDictionary *arrayH) {
        //字典转模型
        NSArray *array = arrayH[@"activities"];
        _modelList = [NSArray yy_modelArrayWithClass:[AFBHomeSecondModel class] json:array];
        [self.collectionView reloadData];
    }];
    [manager getHomeHotSaleDataParameters:@2 CompleteBlock:^(NSDictionary *dicH, NSString *reqid) {
//        NSLog(@"%@",dicH);
        _threeModelList = [NSArray yy_modelArrayWithClass:[AFBHomeThreeModel class] json:dicH];
        [self.collectionView reloadData];
    }];
}

#pragma mark - 设置navigationController
- (void)setNavigation{
//    self.navigationController.navigationBar = 
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
            return _modelList.count;
            break;
        case 2:
            return _threeModelList.count;
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
    
    if (indexPath.section == 0) {
        AFBHomeFirstCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellFrist forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }else if (indexPath.section == 1) {
        AFBHomeSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellSecond forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        AFBHomeSecondModel *model = _modelList[indexPath.row];
        cell.model = model;
        return cell;
    }else if (indexPath.section == 2){
        AFBHomeThreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellThree forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        AFBHomeThreeModel *model = _threeModelList[indexPath.row];
        cell.model = model;
        
        return cell;
    }
    AFBHomeFourCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellFour forIndexPath:indexPath];
    return cell;
}

#pragma mark - collectiondelegateflowlayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat wigth = self.view.bounds.size.width;
    
    if (indexPath.section == 0) {
        
        return CGSizeMake(wigth, 200);
        
    }else if (indexPath.section == 1){
        
        return CGSizeMake(wigth-14, 120);
        
    }else if (indexPath.section == 2){
        
        CGFloat wigth2 = (self.view.bounds.size.width-2)/3;
        CGFloat height = 220;
        return CGSizeMake(wigth2,height);
    }
    return CGSizeMake(wigth, 50);
}

#pragma mark - 代理方法实现
- (void)willPushDrawView{
    if ([_delegate respondsToSelector:@selector(pushDrawView)]) {
        [_delegate pushDrawView];
    }
}

- (void)willPushSecKillView{
    if ([_delegate respondsToSelector:@selector(pushSecKillView)]) {
        [_delegate pushSecKillView];
    }
}

- (void)willPushRedBagView{
    if ([_delegate respondsToSelector:@selector(pushRedBagView)]) {
        [_delegate pushRedBagView];
    }
}

- (void)willPushBeeView{
    if ([_delegate respondsToSelector:@selector(pushBeeView)]) {
        [_delegate pushBeeView];
    }
}

#pragma mark <UICollectionViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint offset = scrollView.contentOffset;
    CGFloat offY = offset.y;
    CGFloat topH = 120+offY;
    CGFloat scal = 1.0/(120-64);
    CGFloat alpth =(topH-64+20)*scal-1;
    if ([self.delegate respondsToSelector:@selector(getAlpha:)]) {
        [self.delegate getAlpha:alpth];
    }
    NSLog(@"alpth = %f,offY=%f",alpth,offY);
}

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
