//
//  AFBOrderGoodsDetailController.m
//  LoveFreshBeeSuper
//
//  Created by Colbert Zhan on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderGoodsDetailController.h"
#import "AFBOrderGoodsDetailsHeadView.h"
#import "AFBOrderGoodsDetailsFootView.h"


@interface AFBOrderGoodsDetailController ()

@property (nonatomic, weak)UIScrollView *scrollView;
@property (nonatomic, weak)AFBOrderGoodsDetailsHeadView *headView;
@property (nonatomic, strong)AFBOrderGoodsDetailsFootView *footView;

@end

@implementation AFBOrderGoodsDetailController

- (void)setModel:(AFBCommonGoodsModel *)model{
    _model = model;
}

- (AFBOrderGoodsDetailsHeadView *)headView{
    if (_headView == nil) {
        _headView = [[[UINib nibWithNibName:@"AFBOrderGoodsDetailsHeadView" bundle:nil] instantiateWithOwner:nil options:0] lastObject];
        _headView.model = self.model;
    }
    
    return _headView;
}

- (AFBOrderGoodsDetailsFootView *)footView{
    if (_footView == nil) {
        _footView = [[AFBOrderGoodsDetailsFootView alloc] init];
    }
    
    return _footView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.model.name;

    [self.navigationController setNavigationBarHidden:NO];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI{
    UIScrollView *scrView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrView];
    self.scrollView = scrView;
    
    UIView *contentView = [[UIView alloc] initWithFrame:scrView.bounds];
    [scrView addSubview:contentView];
    
    //头部视图
    [contentView addSubview:self.headView];
    
    //商品介绍视图
    UIImageView *detailView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goodsDetails"]];
    detailView.backgroundColor = [UIColor redColor];
    [contentView addSubview:detailView];
    
    //底部视图
    [self.view addSubview:self.footView];
    
    //布局
    CGFloat screenW = self.view.bounds.size.width;
    CGFloat headH = self.headView.bounds.size.height;
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(contentView);
        make.width.mas_equalTo(screenW);
        make.height.mas_equalTo(headH);
    }];
    
    CGFloat detailH = detailView.bounds.size.height;
    [detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView.mas_bottom);
        make.left.equalTo(contentView);
        make.width.mas_equalTo(screenW);
        make.height.mas_equalTo(detailH);
    }];
    
    CGFloat footH = self.footView.bounds.size.height;
    [self.footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(screenW);
        make.height.mas_equalTo(footH);
    }];
    
    scrView.contentSize = CGSizeMake(self.view.bounds.size.width, headH + detailH);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
