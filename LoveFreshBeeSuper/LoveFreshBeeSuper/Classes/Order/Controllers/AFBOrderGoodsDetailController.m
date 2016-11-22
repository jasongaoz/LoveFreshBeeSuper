//
//  AFBOrderGoodsDetailController.m
//  LoveFreshBeeSuper
//
//  Created by Colbert Zhan on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderGoodsDetailController.h"
#import "AFBOrderGoodsDetailsHeadView.h"


@interface AFBOrderGoodsDetailController ()

@property (nonatomic, weak)UIScrollView *scrollView;

@end

@implementation AFBOrderGoodsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    UIScrollView *scrView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:scrView];
    self.scrollView = scrView;
    
    //头部视图
    AFBOrderGoodsDetailsHeadView *headView = [[[UINib nibWithNibName:@"AFBOrderGoodsDetailsHeadView" bundle:nil] instantiateWithOwner:nil options:0] lastObject];
    [scrView addSubview:headView];
    
    //商品介绍视图
    UIImageView *detailView = [[UIImageView alloc] init];
    detailView.image = [UIImage imageNamed:@"goodsDetails"];
    [scrView addSubview:detailView];
    
    //布局
    CGFloat screenW = self.view.bounds.size.width;
    CGFloat headH = headView.bounds.size.height;
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(scrView);
        make.width.mas_equalTo(screenW);
        make.height.mas_equalTo(headH);
    }];
    
    CGFloat detailH = detailView.bounds.size.height;
    [detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView.mas_bottom);
        make.left.equalTo(scrView);
        make.width.mas_equalTo(screenW);
        make.height.mas_equalTo(detailH);
    }];
    
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
