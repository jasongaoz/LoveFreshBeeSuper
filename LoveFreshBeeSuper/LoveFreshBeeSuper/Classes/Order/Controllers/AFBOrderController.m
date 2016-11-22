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

#define kTopHeight 64
#define kWidth [UIScreen ay_screenWidth]/4

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
    [self setMyView];
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
        
        [self addTableView];
        
        [_bgImageView removeFromSuperview];
        [SVProgressHUD dismiss];
        
    }];
    
    //获取热搜关键字
    [manager getSearchKeyWordParameters:@(6) CompleteBlock:^(NSDictionary *dicH) {
        NSLog(@"====%@",dicH[@"hotquery"]);
        _searchKeyWord = dicH[@"hotquery"];
    }];
    
}

//MARK:添加 设置等待网络加载页面
- (void)setMyView{
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * gbImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bookbottomdefault"]];
    gbImageView.center = self.view.center;
//    CGPoint imageCenter = CGPointMake(self.view.center.x, self.view.center.y+50);
    gbImageView.center = self.view.center;
    _bgImageView = gbImageView;
    [self.view addSubview:gbImageView];
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


//MARK:添加 设置tableView
- (void)addTableView{
    CGFloat arViewHeight = 40;
   
    AFBOrderLeftTableView * leftTableView = [[AFBOrderLeftTableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, [UIScreen ay_screenHeight])];
    AFBOrderRightTableView * rightTableView = [[AFBOrderRightTableView alloc]initWithFrame:CGRectMake(kWidth, 0, kWidth*3, [UIScreen ay_screenHeight])];
    rightTableView.contentInset = UIEdgeInsetsMake(arViewHeight, 0, 0, 0);
     AFBOrderGoodsArrangeView *arrangeView = [[AFBOrderGoodsArrangeView alloc]initWithFrame:CGRectMake(kWidth, 0, kWidth*3, arViewHeight)];
    
    _arrangeView = arrangeView;
    _leftTableView = leftTableView;
    _rightTableView = rightTableView;
    
    [arrangeView addTarget:self action:@selector(clickArrangeControl) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:leftTableView];
    [self.view addSubview:rightTableView];
    [self.view addSubview:arrangeView];
    
    //数据源
    leftTableView.dataSource = self;
    rightTableView.dataSource = self;
    
    //代理
    leftTableView.delegate = self;
    rightTableView.delegate = self;
    
    //注册cell
    [leftTableView registerClass:[AFBOrderLeftCell class] forCellReuseIdentifier:orderLeftCellID];
    [rightTableView registerNib:[UINib nibWithNibName:@"AFBOrderRightCell" bundle:nil] forCellReuseIdentifier:orderRightCellID];
    
    NSInteger defaultSelect = 0;
    //右侧view默认显示的数据
    _rightDataList = _goodsDataDic[_leftDataList[defaultSelect].idKey];
    
    //刷新两侧的tableView数据
    [_leftTableView reloadData];
    [_rightTableView reloadData];
    
    //左侧view的默认选中行
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:defaultSelect inSection:0];
    [_leftTableView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
}

//MARK:点击排序方式
- (void)clickArrangeControl{
    NSLog(@"点击了排序按钮");
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
        [_rightTableView reloadData];
    }else{
        NSLog(@"push到相对应页面");
    }
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
