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

static NSString *orderRightCellID = @"orderRightCellID";
static NSString *orderLeftCellID = @"orderLeftCellID";

@interface AFBOrderController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AFBOrderController{
    AFBOrderLeftTableView *_leftTableView;
    AFBOrderRightTableView *_rightTableView;
    NSArray<AFBOrderLeftModel *>*_leftDataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
}

- (void)setupUI{
    self.navigationItem.title = @"闪送超市";
    self.view.backgroundColor = [UIColor grayColor];
    
    [self addTableView];
    [self addNavigationItem];
}

//MARK:加载数据
- (void)loadData{
    AFBDownLoadManager * manager = [AFBDownLoadManager shareManager];
    [manager getSuperMarketDataWithParameters:@(5) CompleteBlock:^(NSArray *arrayCategories, NSDictionary *dicProduct) {

            _leftDataList = [NSArray yy_modelArrayWithClass:[AFBOrderLeftModel class] json:arrayCategories];
        [_leftTableView reloadData];
//        [dicProduct writeToFile:@"/Users/Yin_Y/Desktop/好运常来/LoveFreshBeeSuper/LoveFreshBeeSuper/Classes/Order/Models" atomically:YES];
//        NSLog(@"%@",dicProduct);
        //让左边tableView默认选中第0行
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [_leftTableView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }];
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
    NSLog(@"点击了扫一扫");
}

- (void)clickRightItem{
    NSLog(@"点击了搜索");
    
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
        make.top.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(80);
    }];
    
    [_rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(64);
        make.left.equalTo(leftTableView.mas_right);
        make.right.bottom.equalTo(self.view);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        NSLog(@"如果点击的是左侧cell,切换数据源,当前切换到数据源%zd",indexPath.row+1);
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
        
        return 10;
    }
    return _leftDataList.count;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (tableView == _leftTableView) {
        AFBOrderLeftCell * cell = [tableView dequeueReusableCellWithIdentifier:orderLeftCellID forIndexPath:indexPath];
        
        cell.dataModel = _leftDataList[indexPath.row];
        
        return cell;
    }
    else{
    cell = [tableView dequeueReusableCellWithIdentifier:orderRightCellID forIndexPath:indexPath];
    }
    
    
    return cell;
    
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
