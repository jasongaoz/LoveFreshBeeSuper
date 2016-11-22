 //
//  AFBOrderSearchController.m
//  LoveFreshBee
//
//  Created by Colbert Zhan on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderSearchController.h"
#import "AFBHomeCollectionController.h"
#import "AFBHomeFlowLayout.h"
#import "AFBHomeThreeCell.h"
#import "AFBDownLoadManager.h"
#import <SVProgressHUD.h>


static NSString *cellThree = @"cellThree";
@interface AFBOrderSearchController ()<UICollectionViewDelegateFlowLayout>

@end
@implementation AFBOrderSearchController{
    NSArray *_threeModelList;
}

//重新init方法
- (instancetype)init{
    AFBHomeFlowLayout *layout = [[AFBHomeFlowLayout alloc]init];
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    self.navigationItem.backBarButtonItem.title = @"";
    
    self.navigationItem.backBarButtonItem.tintColor = [UIColor grayColor];
    
    [super viewDidLoad];
    [SVProgressHUD show];
    
    // 加载数据
    [self loadData];
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    //注册
    [self.collectionView registerClass:[AFBHomeThreeCell class] forCellWithReuseIdentifier:cellThree];
    
}

//返回按钮点击事件
- (void)searchNavBackBtnClicked{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - loadData
- (void)loadData{
    AFBDownLoadManager *manager = [AFBDownLoadManager shareManager];
    
    [manager getSearchDataParameters:@2 CompleteBlock:^(NSDictionary *dicH) {
        _threeModelList = [NSArray yy_modelArrayWithClass:[AFBHomeThreeModel class] json:dicH];
        [self.collectionView reloadData];
        [SVProgressHUD dismiss];
    }];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _threeModelList.count;
    //    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AFBHomeThreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellThree forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    AFBHomeThreeModel *model = _threeModelList[indexPath.row];
    cell.model = model;
    
    return cell;
}

#pragma mark - collectiondelegateflowlayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat wigth = (self.view.bounds.size.width-21)/2;
    CGFloat height = 220;
    return CGSizeMake(wigth,height);
}

- (void)backBtnClicked{
    
    self.navigationController.navigationBar.alpha = 1;
    [self.navigationController popViewControllerAnimated:YES];
}

//修改电池条的颜色状态
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
