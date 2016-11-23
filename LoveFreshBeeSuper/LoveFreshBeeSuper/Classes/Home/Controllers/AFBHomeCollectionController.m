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
#import "AFBCommonGoodsModel.h"
#import "AFBHomeFourCell.h"
#import "AFBOrderGoodsDetailController.h"
#import "UITabBar+AFBBage.h"

#import <SVProgressHUD.h>
#import <MJRefresh.h>

@interface AFBHomeCollectionController ()<UICollectionViewDelegateFlowLayout,AFBHomeFirstCellDelegate,AFBHomeThreeCellDelegate,CAAnimationDelegate>
@property (nonatomic,strong) MJRefreshGifHeader * header;
@end

static NSString *cellFrist = @"cellFrist";
static NSString *cellSecond = @"cellSecond";
static NSString *cellThree = @"cellThree";
static NSString *cellFour = @"cellFour";
@implementation AFBHomeCollectionController{
    NSMutableArray *_imageArray;
    NSArray *_modelList;
    NSArray *_threeModelList;
    NSMutableArray<AFBHomeThreeModel *> *_seletedArray;
}

//重新init方法
- (instancetype)init{
    AFBHomeFlowLayout *layout = [[AFBHomeFlowLayout alloc]init];
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _seletedArray = [NSMutableArray array];
    [SVProgressHUD show];
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
    
    //设置下拉刷新
    _imageArray = [NSMutableArray array];
    [_imageArray addObject:[UIImage imageNamed:@"v2_pullRefresh1"]];
    [_imageArray addObject:[UIImage imageNamed:@"v2_pullRefresh2"]];

    MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    _header = header;

    [header setImages:_imageArray forState:MJRefreshStatePulling];
    [header setImages:_imageArray forState:MJRefreshStateRefreshing];
    [header setImages:_imageArray forState:MJRefreshStateIdle];
    self.collectionView.mj_header = header;

    [header setTitle:@"已刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开立刻刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    
    header.lastUpdatedTimeLabel.hidden = YES;
    
    [header beginRefreshing];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

#pragma mark - 实现代理方法传输数据
- (void)homeThreeCell:(AFBHomeThreeCell *)homeThreeCell withAddModel:(AFBHomeThreeModel *)Model withStartPoint:(CGPoint)startp{
    //1动画
    [self startAnimationWithStartPoint:startp cell:homeThreeCell];
    //2数据
    if (![_seletedArray containsObject:Model]) {
        [_seletedArray addObject:Model];
    }
    //总的商品个数
    if (_modelList) {
        __block NSInteger countAll = 0;
        [_seletedArray enumerateObjectsUsingBlock:^(AFBHomeThreeModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            countAll += obj.buyCount;
        }];
        NSString *countStr = [NSString stringWithFormat:@"%zd",countAll];
        [self.tabBarController.tabBar showBadgeOnItemIndex:2 withBadge:countStr];
    }
}

#pragma mark - 设置顶部刷新
- (void)headerRefresh{
    [self.collectionView reloadData];
    [self.collectionView.mj_header endRefreshing];
}


#pragma mark - 添加动画
//实现cell的代理方法
- (void)homeThreeCell:(AFBHomeThreeCell *)homeThreeCell startP:(CGPoint)startP{
    //1添加动画
//    [self addAnimationWithStartPoint:startP cell:homeThreeCell];
}
//动画实现
- (void)startAnimationWithStartPoint:(CGPoint)startP cell:(AFBHomeThreeCell *)cell{
    UIImage *ima = cell.imageView.image;
    UIImageView *imaV = [[UIImageView alloc]initWithImage:ima];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:imaV];
    imaV.center = startP;
    imaV.bounds = CGRectMake(0, 0, 160, 160);
    
    CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CABasicAnimation *basicScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    CABasicAnimation *basicOpacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    UIBezierPath *path = [UIBezierPath bezierPath];
    //keyAnimation
    CGFloat wigth = [UIScreen mainScreen].bounds.size.width/8;
    CGFloat endX = wigth*5;
    [path moveToPoint:startP];
    CGPoint controlP = CGPointMake(startP.x, startP.y-200);
    CGPoint endP = CGPointMake(endX, [UIScreen mainScreen].bounds.size.height-40);
    [path addQuadCurveToPoint:endP controlPoint:controlP];
    key.path = path.CGPath;
    key.duration = 1;
    [key setValue:imaV forKey:@"key"];
    key.removedOnCompletion = NO;
    key.fillMode = kCAFillModeForwards;
    
    //basicScale
    basicScale.fromValue = @(1);
    basicScale.toValue = @(0.1);
    basicScale.duration = 1;
    basicScale.removedOnCompletion = NO;
    basicScale.fillMode = kCAFillModeForwards;
    
    //basicOpacity
    basicOpacity.duration = 1;
    basicOpacity.fromValue = @(1);
    basicOpacity.toValue = @(0.5);
    basicOpacity.removedOnCompletion = NO;
    basicOpacity.fillMode = kCAFillModeForwards;
    
    //添加动画
    key.delegate = self;
    [imaV.layer addAnimation:key forKey:@"keyAmimation"];
    [imaV.layer addAnimation:basicScale forKey:@"basicScale"];
    [imaV.layer addAnimation:basicOpacity forKey:@"basicOpacity"];
}
//结束动画后操作
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    UIImageView *imaV = [anim valueForKey:@"key"];
    [imaV removeFromSuperview];
    //给购物车赋值
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//#pragma mark - 添加下拉刷新
//- (void)getRefresh{
//    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
//    [self.collectionView addSubview:refresh];
//
//    NSAttributedString *arrStr = [[NSAttributedString alloc]initWithString:@"努力刷新" attributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
//    
//    [refresh setAttributedTitle:arrStr];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}


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
        _threeModelList = [NSArray yy_modelArrayWithClass:[AFBCommonGoodsModel class] json:dicH];
        [self.collectionView reloadData];
    }];
    
    [SVProgressHUD dismiss];
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
    }else if (indexPath.section == 1){
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
        cell.delegate = self;
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
//    NSLog(@"%.f",offset.y);
    
    if (offset.y < -20) {
        if ([_delegate respondsToSelector:@selector(refreshStart)]) {
            [_delegate refreshStart];
        }
    }
    
    if (offset.y == -20) {
        if ([_delegate respondsToSelector:@selector(refreshEnd)]) {
            [_delegate refreshEnd];
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    
    AFBOrderGoodsDetailController * goodsDetailController = [[AFBOrderGoodsDetailController alloc] init];
    goodsDetailController.model = _threeModelList[indexPath.item];
    [self.navigationController pushViewController:goodsDetailController animated:YES];
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
