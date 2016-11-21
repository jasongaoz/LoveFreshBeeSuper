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

static NSString *orderRightCellID = @"orderRightCellID";
static NSString *orderLeftCellID = @"orderLeftCellID";

@interface AFBOrderController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AFBOrderController{
    AFBOrderLeftTableView * _leftTableView;
    AFBOrderRightTableView * _rightTableView;
    NSArray<AFBOrderLeftModel *> * _leftDataList;
    NSArray<AFBCommonGoodsModel *> * _rightDataList;
    NSMutableDictionary*_goodsDataDic;
    UIView *_bgImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _goodsDataDic = [NSMutableDictionary dictionary];
    // Do any additional setup after loading the view.
    [self loadData];
}

- (void)setupUI{
    self.navigationItem.title = @"闪送超市";
    self.view.backgroundColor = [UIColor grayColor];
    
    [self addNavigationItem];
    [self setMyView];
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
    
}

//MARK:添加 设置背景占位页面
- (void)setMyView{
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * gbImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bookbottomdefault"]];
    gbImageView.center = self.view.center;
    
    CGPoint imageCenter = CGPointMake(self.view.center.x, self.view.center.y+50);
    gbImageView.center = imageCenter;
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
    
    AFBOrderSearchController *vc = [[AFBOrderSearchController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


//MARK:添加 设置tableView
- (void)addTableView{
    AFBOrderLeftTableView * leftTableView = [AFBOrderLeftTableView new];
    AFBOrderRightTableView * rightTableView = [AFBOrderRightTableView new];
    
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
    
    [_leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(80);
    }];
    
    [_rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_leftTableView);
        make.left.equalTo(leftTableView.mas_right);
        make.right.bottom.equalTo(self.view);
        
    }];

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK:cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        NSString * goodsListKey = _leftDataList[indexPath.row].idKey;
        _rightDataList = _goodsDataDic[goodsListKey];
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
