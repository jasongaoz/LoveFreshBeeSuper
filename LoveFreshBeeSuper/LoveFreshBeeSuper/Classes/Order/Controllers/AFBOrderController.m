//
//  AFBOrderController.m
//  LoveFreshBee
//
//  Created by Adam on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderController.h"
#import "AFBOrderRightCell.h"
#import "AFBOrderLeftCell.h"
#import "AFBOrderRightTableView.h"
#import "AFBOrderLeftTableView.h"
#import "AFBOrderSearchController.h"
#import "AFBDownLoadManager.h"
#import "AFBOrderLeftModel.h"
#import <YYModel.h>
#import <SVProgressHUD.h>
#import "AFBSweepViewController.h"
#import "AFBCommonGoodsModel.h"
#import <PYSearch.h>
#import "AFBOrderGoodsArrangeView.h"
#import "AFBPriceArrangeControl.h"


#define kTopHeight 64
#define kWidth [UIScreen ay_screenWidth]/4
#define kARViewHeight 40

#import "AFBOrderGoodsDetailController.h"


static NSString *orderRightCellID = @"orderRightCellID";
static NSString *orderLeftCellID = @"orderLeftCellID";
static NSString *rightHeader = @"rightHeader";

@interface AFBOrderController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AFBOrderController{
    AFBOrderLeftTableView * _leftTableView;
    AFBOrderRightTableView * _rightTableView;
    NSArray<AFBOrderLeftModel *> * _leftDataList;
    NSArray<AFBCommonGoodsModel *> * _rightDataList;
    NSMutableDictionary*_goodsDataDic;//右侧所有商品数据
    UIView *_bgImageView;//占位背景view
    AFBOrderGoodsArrangeView *_arrangeView;//排序方式View
    
    NSArray *_searchKeyWord;//热搜关键字数据
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    _goodsDataDic = [NSMutableDictionary dictionary];
    // Do any additional setup after loading the view.
    [self loadData];
}

- (void)setupUI{
    self.navigationController.navigationBar.translucent = NO;
   
    self.navigationItem.title = @"闪送超市";
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationController.navigationBar.translucent = NO;
    [self addNavigationItem];
    [self addTableView];
    [self addArrageView];
    [self addMyView];
    //    [self addTableView];
}

//MARK:加载数据
- (void)loadData{
    AFBDownLoadManager * manager = [AFBDownLoadManager shareManager];
    
    [manager getSuperMarketDataWithParameters:@(5) CompleteBlock:^(NSDictionary *dataDic) {
        
        _leftDataList = [NSArray yy_modelArrayWithClass:[AFBOrderLeftModel class] json:dataDic[@"categories"]];
        
        NSDictionary * tempDic = dataDic[@"products"];
        [tempDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSArray * obj, BOOL * _Nonnull stop) {
            
            NSArray *tempArray = [NSArray yy_modelArrayWithClass:[AFBCommonGoodsModel class] json:obj];
            
            [_goodsDataDic setObject:tempArray forKey:key];
        }];
        
        [self tableViewReloadData];
        
        [_bgImageView removeFromSuperview];
        [SVProgressHUD dismiss];
        
    }];
    
    //获取热搜关键字
    [manager getSearchKeyWordParameters:@(6) CompleteBlock:^(NSDictionary *dicH) {
 
        _searchKeyWord = dicH[@"hotquery"];
    }];
    
}

//MARK:数据初始化
- (void)tableViewReloadData{
    NSInteger defaultSelect = 0;
    //右侧view默认显示的数据
    _rightDataList = _goodsDataDic[_leftDataList[defaultSelect].idKey];
    //右侧view数据默认设置为综合排序
    _rightDataList = [_rightDataList sortedArrayUsingComparator:^NSComparisonResult(AFBCommonGoodsModel * obj1, AFBCommonGoodsModel * obj2) {
        return [obj1.product_id integerValue] > [obj2.product_id integerValue];
    }];

    
    //刷新两侧的tableView数据
    [_leftTableView reloadData];
    [_rightTableView reloadData];
    
    //左侧view的默认选中行
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:defaultSelect inSection:0];
    [_leftTableView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    
}

//MARK:添加 设置等待网络加载页面
- (void)addMyView{
    _bgImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    UIImageView * imView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bookbottomdefault"]];
    imView.center = _bgImageView.center;
    _bgImageView.backgroundColor = [UIColor whiteColor];
    [_bgImageView addSubview:imView];
    [self.view addSubview:_bgImageView];
    [SVProgressHUD show];
}

//MARK:添加 设置NavigationItem
- (void)addNavigationItem{
    //左侧
    //不让系统渲染图片
    UIImage *leftImage = [[UIImage imageNamed:@"icon_black_scancode"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftItem)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //右侧
    //不让系统渲染图片
    UIImage *rightImage = [[UIImage imageNamed:@"icon_search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)clickLeftItem{
    AFBSweepViewController * sweepVC = [AFBSweepViewController new];
    
    [self.navigationController pushViewController:sweepVC animated:YES];
}

- (void)clickRightItem{
    
    //获取热度搜索关键字
    
    NSArray *hotSeaches = _searchKeyWord;
    
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"请输入商品名称" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        
        // 跳转到指定控制器
        AFBOrderSearchController *vc = [[AFBOrderSearchController alloc] init];
        
        [searchViewController.navigationController pushViewController:vc animated:YES];
    }];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav  animated:NO completion:nil];
}

//MARK:添加设置选择排序条
- (void)addArrageView{
    AFBOrderGoodsArrangeView *arrangeView = [[AFBOrderGoodsArrangeView alloc]initWithFrame:CGRectMake(kWidth, 0, kWidth*3, kARViewHeight)];
    _arrangeView = arrangeView;
    
    //给综合排序和销量排序添加点击事件
    [arrangeView.noumBut addTarget:self action:@selector(clickArrangeControl:) forControlEvents:UIControlEventTouchUpInside];
    [arrangeView.salesVolumeBut addTarget:self action:@selector(clickArrangeControl:) forControlEvents:UIControlEventTouchUpInside];
    [arrangeView.priceBut addTarget:self action:@selector(clickArrangeControl:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:arrangeView];
}

//MARK:切换排序方法
- (void)clickArrangeControl:(AFBOrderCommonControlBut *)sender{
    

    switch (sender.arrangeType) {
        case ArrangeType_Noum: //综合排序
            
            _rightDataList = [_rightDataList sortedArrayUsingComparator:^NSComparisonResult(AFBCommonGoodsModel * obj1, AFBCommonGoodsModel * obj2) {
                return [obj1.product_id integerValue] > [obj2.product_id integerValue];
            }];
            break;
        case ArrangeType_Price:  //价格排序
          
            if (_arrangeView.priceBut.isUP) {
                _rightDataList = [_rightDataList sortedArrayUsingComparator:^NSComparisonResult(AFBCommonGoodsModel * obj1, AFBCommonGoodsModel * obj2) {
                    return [obj1.partner_price floatValue] > [obj2.partner_price floatValue];
                }];
            }else{
                _rightDataList = [_rightDataList sortedArrayUsingComparator:^NSComparisonResult(AFBCommonGoodsModel * obj1, AFBCommonGoodsModel * obj2) {
                    return [obj1.partner_price floatValue] < [obj2.partner_price floatValue];
                }];
            }
            
            break;
        case ArrangeType_SalesVolume:  //销量排序
            _rightDataList = [_rightDataList sortedArrayUsingComparator:^NSComparisonResult(AFBCommonGoodsModel * obj1, AFBCommonGoodsModel * obj2) {
                return [obj1.number integerValue] < [obj2.number integerValue];
            }];
            break;
    }
    [_rightTableView reloadData];
}

//MARK:添加 设置tableView
- (void)addTableView{
    
    AFBOrderLeftTableView * leftTableView = [[AFBOrderLeftTableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, [UIScreen ay_screenHeight])];
    //关闭左侧tableView的水平滚动指示器
    leftTableView.showsVerticalScrollIndicator = NO;
    AFBOrderRightTableView * rightTableView = [[AFBOrderRightTableView alloc]initWithFrame:CGRectMake(kWidth, kARViewHeight, kWidth*3, [UIScreen ay_screenHeight])];
    rightTableView.contentInset = UIEdgeInsetsMake(0, 0, kARViewHeight*4, 0);
    
    _leftTableView = leftTableView;
    _rightTableView = rightTableView;
    
    [self.view addSubview:leftTableView];
    [self.view addSubview:rightTableView];
    
    
    //数据源
    leftTableView.dataSource = self;
    rightTableView.dataSource = self;
    
    //代理
    leftTableView.delegate = self;
    rightTableView.delegate = self;
    
    //注册cell
    [leftTableView registerClass:[AFBOrderLeftCell class] forCellReuseIdentifier:orderLeftCellID];
    [rightTableView registerNib:[UINib nibWithNibName:@"AFBOrderRightCell" bundle:nil] forCellReuseIdentifier:orderRightCellID];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK:cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        //通过左侧类型tableViewModel的idKey属性确定右侧商品tableView的数据源,并刷新右侧商品数据
        _rightDataList = _goodsDataDic[_leftDataList[indexPath.row].idKey];
        _rightDataList = [_rightDataList sortedArrayUsingComparator:^NSComparisonResult(AFBCommonGoodsModel * obj1, AFBCommonGoodsModel * obj2) {
            return [obj1.product_id integerValue] > [obj2.product_id integerValue];
        }];
        [_arrangeView clickBtn:_arrangeView.noumBut];
        [self clickArrangeControl:_arrangeView.noumBut];
        [_rightTableView reloadData];
        
        [_rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }else{
        
        AFBOrderGoodsDetailController *goodsDetailVC = [[AFBOrderGoodsDetailController alloc] init];
        goodsDetailVC.model = _rightDataList[indexPath.row];

        [self.navigationController pushViewController:goodsDetailVC animated:YES];
    }
}



//MARK:动画
//动画实现
- (void)startAnimationWithStartPoint:(CGPoint)startP cell:(AFBOrderRightCell *)cell{
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


#pragma mark - 实现数据源方法
//组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _rightTableView) {
        
        return 1;
    }
    
    return 1;
}
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _rightTableView) {
        
        return _rightDataList.count;
    }
    return _leftDataList.count;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == _leftTableView) {
        AFBOrderLeftCell * cell = [tableView dequeueReusableCellWithIdentifier:orderLeftCellID forIndexPath:indexPath];
        
        cell.dataModel = _leftDataList[indexPath.row];
        
        return cell;
    }
    else{
        AFBOrderRightCell *cell = [tableView dequeueReusableCellWithIdentifier:orderRightCellID forIndexPath:indexPath];
        
        cell.dataModel = _rightDataList[indexPath.row];
        return cell;
    }
    
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
