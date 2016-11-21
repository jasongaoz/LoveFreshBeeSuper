//
//  AFBAddressController.m
//  AFBMineAddress
//
//  Created by drfgh on 16/11/20.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import "AFBAddressController.h"
#import "AFBAddressCell.h"
#import "Masonry.h"
#import "AFBEditAddressController.h"

static NSString *cellID = @"cell";
@interface AFBAddressController ()
@property (nonatomic,weak) UIView *footV;
@end

@implementation AFBAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.navigationItem.title = @"我的收货地址";
    self.tableView.rowHeight = 80;
    [self.tableView registerClass:[AFBAddressCell class] forCellReuseIdentifier:cellID];
    
    [self setupUI];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setupUI{
    UIView *footV = [[UIView alloc]init];
    self.footV = footV;
    [[UIApplication sharedApplication].keyWindow addSubview:footV];
    footV.frame = CGRectMake(0, 600, [UIScreen mainScreen].bounds.size.width, 70);
    
    UIButton *btn_address = [[UIButton alloc]init];
    btn_address.layer.cornerRadius = 5;
//    [btn_address setImage:[UIImage imageNamed:@"coupon_verify_normal"] forState:UIControlStateNormal];
    btn_address.backgroundColor = [UIColor yellowColor];
    [btn_address setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_address setTitle:@"+新增地址" forState:UIControlStateNormal];
    [footV addSubview:btn_address];
    [btn_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(footV);
        make.width.mas_equalTo(200);
    }];
    
    [btn_address addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    footV.hidden = NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AFBAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
//    [cell.btn_pic addObserver:self forKeyPath:@"Highlighted" options:NSKeyValueObservingOptionNew context:nil];
    [cell.btn_pic addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)push{
    AFBEditAddressController *eaVc = [[AFBEditAddressController alloc]init];
    [self.navigationController pushViewController:eaVc animated:YES];
    self.footV.hidden = YES;
}

- (void)pushNextv{
    AFBEditAddressController *eaVc = [[AFBEditAddressController alloc]init];
    [self.navigationController pushViewController:eaVc animated:YES];
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 80;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
