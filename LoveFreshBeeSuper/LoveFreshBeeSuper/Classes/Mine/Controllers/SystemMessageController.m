//
//  SystemMessageController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "SystemMessageController.h"
#import "AFBHolderView.h"
#import "SystemMessageModel.h"
#import "SystemMessageCell.h"

static NSString *systemCellID = @"oneCell";



@interface SystemMessageController ()

@property (nonatomic, strong) AFBHolderView *holderView;
@property (nonatomic, strong) NSMutableArray *objs;

@end

@implementation SystemMessageController

/**
 *  懒加载
 */
- (NSMutableArray *)objs
{
    if (_objs == nil)
    {
        _objs = [[NSMutableArray alloc] init];
    }
    return _objs;
}


- (void)loadView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    self.tableView.rowHeight = 120;
    self.tableView.backgroundColor = AFBRGBCommonColor(224);
    // 隐藏分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[SystemMessageCell class] forCellReuseIdentifier:systemCellID];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"111111");
    
    
    // 创建占位图片
    [self setupAFBHolderView];

    
    
    
    // 假数据
    for (int i = 0; i < 3; i++) {
        SystemMessageModel *model = [[SystemMessageModel alloc] init];
        model.titleText = @"标题123";
        model.isShowMore = YES;
        model.detailsText = @"贷款及少积分了看见俺打算离开房间辣打开手机发垃圾都是浪费空间按到了考试及福利卡美国非任何格式的君讲条件还玩儿过电视剧。";
        [self.objs addObject:model];
    }
}
// view 已经布局好的时候 更改大小
- (void)viewDidLayoutSubviews {
    CGFloat holderViewW = 160;
    CGFloat holderViewH = 200;
    CGFloat holderViewX = (kScreenWidth - holderViewW)/2;
    CGFloat holderViewY = (self.tableView.frame.size.height - holderViewH)/2;
    _holderView.frame = CGRectMake(holderViewX, holderViewY, holderViewW, holderViewH);
}

#pragma mark - 创建占位图片

- (void)setupAFBHolderView {
    _holderView = [AFBHolderView creatHolderViewWithImageName:@"没有消息呦" lbName:@"pushlistview_up"];
    [self.tableView addSubview:_holderView];
    
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    _holderView.hidden = self.objs.count;
    return self.objs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SystemMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:systemCellID forIndexPath:indexPath];
    cell.model = self.objs[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

@end
