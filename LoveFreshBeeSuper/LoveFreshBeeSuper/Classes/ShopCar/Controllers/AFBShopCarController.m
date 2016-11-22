//
//  AFBShopCarController.m
//  LoveFreshBee
//
//  Created by Adam on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBShopCarController.h"
#import "AFBHomeController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "AFBShopCarFisrtCell.h"
#import "AFBShopCarSupermarkerCell.h"
#import "AFBAdressTimeCell.h"
#import "AFBCouDanCell.h"
#import "AFBBusinessListCell.h"
#import "AFBCommentCell.h"
#import "AFBAllSelCell.h"
#import "AFBCommentController.h"

static NSString *FirstID = @"fis_id";
static NSString *shopMakID = @"shopMak_id";
static NSString *AdressID = @"adr_id";
static NSString *buyCardID = @"buy_id";
static NSString *BusiListID = @"business_id";
static NSString *CommentID = @"comment_id";
static NSString *AllselID = @"allSelID";

@interface AFBShopCarController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *shopCarView;



@end

@implementation AFBShopCarController
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//
- (void)viewDidAppear:(BOOL)animated{
    
    [self loadData];
}
- (void)viewDidDisappear:(BOOL)animated{
    [SVProgressHUD dismiss];
}
- (void)loadData{
    self.shopModelList = @[@1,@2];
    if (self.shopModelList) {
        NSLog(@"加载数据");
//        [SVProgressHUD showWithStatus:@"正在验证商品信息"];
    }else{
        return;
    }
}

- (void)setupUI{
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    self.navigationItem.title = @"购物车";
    self.shopModelList = @[@1,@2];
    //这里要判断是否有数据,进入这个页面的时候
    if (self.shopModelList) {
        UITableView *shopCarView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        [self.view addSubview:shopCarView];
        self.shopCarView = shopCarView;
        shopCarView.delegate = self;
        shopCarView.dataSource = self;
//        shopCarView.rowHeight = 100;
        
//        shopCarView.separatorColor = [UIColor blackColor];
//        shopCarView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        //注册
        [shopCarView registerNib:[UINib nibWithNibName:@"AFBShopCarFisrtCell" bundle:nil] forCellReuseIdentifier:FirstID];
        [shopCarView registerNib:[UINib nibWithNibName:@"AFBShopCarSupermarkerCell" bundle:nil] forCellReuseIdentifier:shopMakID];
        [shopCarView registerNib:[UINib nibWithNibName:@"AFBAdressTimeCell" bundle:nil] forCellReuseIdentifier:AdressID];
        [shopCarView registerNib:[UINib nibWithNibName:@"AFBCouDanCell" bundle:nil] forCellReuseIdentifier:buyCardID];
        [shopCarView registerClass:[AFBBusinessListCell class] forCellReuseIdentifier:BusiListID];
        [shopCarView registerClass:[AFBCommentCell class] forCellReuseIdentifier:CommentID];
        [shopCarView registerClass:[AFBAllSelCell class] forCellReuseIdentifier:AllselID];
    }else{

        UIImageView *shopView = [[UIImageView alloc] init];
        shopView.image = [UIImage imageNamed:@"v2_shop_empty"];
        [self.view addSubview:shopView];
        UILabel *desLabel = [[UILabel alloc] init];
        desLabel.text = @"亲,购物车空空的耶~赶紧去挑好吃的吧";
        desLabel.font = [UIFont systemFontOfSize:14];
        desLabel.textColor = [UIColor grayColor];
        desLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:desLabel];
        UIButton *searchBtn = [[UIButton alloc] init];
        [searchBtn setTitle:@"去逛逛" forState:UIControlStateNormal];
        [searchBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [searchBtn.layer setBorderWidth:0.5];
        [searchBtn addTarget:self action:@selector(jumpToHomeVc) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:searchBtn];
        //布局
        [shopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view).offset(-80);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
        }];
        [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.centerX.equalTo(self.view);
            
        }];
        [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view).offset(40);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(40);
        }];
    }
    
}
- (void)jumpToHomeVc{
    [self.tabBarController setSelectedIndex:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

//每组的row数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 3 ;
    }
    else if (section == 2){
       return _shopModelList.count;
    }
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //创建第一种cell
        AFBShopCarFisrtCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0) {
        //创建第二种cell 闪送超市
        AFBShopCarSupermarkerCell *cell = [tableView dequeueReusableCellWithIdentifier:shopMakID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 1) {
        //创建第三种cell 收货时间
        AFBAdressTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:AdressID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 2){
        AFBCouDanCell *cell = [tableView dequeueReusableCellWithIdentifier:buyCardID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if(indexPath.section == 2){
        // 商品列表
        AFBBusinessListCell * cell = [tableView dequeueReusableCellWithIdentifier:BusiListID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //        cell.height = 60;
//        cell.textLabel.text = @"1111";
        return cell;
    }
//    else if(indexPath.section == 3 && indexPath.row == 0){
//        
//        AFBBuyCardCell *cell = [tableView dequeueReusableCellWithIdentifier:buyCardID forIndexPath:indexPath];
////        cell.height = 60;
//        return cell;
//    }
    else if (indexPath.section == 3 && indexPath.row == 0){
        AFBCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CommentID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 3 && indexPath.row == 1){
        AFBAllSelCell *cell = [tableView dequeueReusableCellWithIdentifier:AllselID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}
//设置组头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 ||section == 1) {
        return 10.0;
    }
    return 0.5;
}
//设置组尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    else if(indexPath.section == 1 && indexPath.row == 0){
        return 39;
    }
    else if((indexPath.section == 1 && indexPath.row == 1) || (indexPath.section == 1 && indexPath.row == 2)) {
        return 74;
    }
    else if(indexPath.section == 2){
        return 80;
    }
    return 60;
}
//cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSLog(@"点击了第一个cell");
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
        NSLog(@"点击了闪送超时");
    }
    else if(indexPath.section == 1 && indexPath.row == 2){
        NSLog(@"点击凑单专区");
    }
    else if(indexPath.section == 2){
        NSLog(@"点击了商品列表");
    }
    else if(indexPath.section == 3 && indexPath.row == 0){
        NSLog(@"点击了备注");
        AFBCommentController *comVc = [[AFBCommentController alloc] init];
        [self.navigationController pushViewController:comVc animated:YES];
        [self.navigationController hidesBottomBarWhenPushed];
        
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
