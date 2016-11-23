//
//  AFBCommentController.m
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBCommentController.h"
#import "AFBCommentTopListCell.h"
static NSString *cellID = @"cell_id";
static NSString *footID = @"foot_id";

@interface AFBCommentController ()<UITextViewDelegate,AFBCommentTopListCellDelegate>

@property(nonatomic,weak) UITextView *textViewV;
@property(nonatomic,weak) UILabel *placehoder;
@property(nonatomic,weak) UIButton *commitBtn;
@property(nonatomic,strong) NSMutableArray <NSString *> *arrayM;
@property(nonatomic,copy) NSString *string;
@end

@implementation AFBCommentController{

    
}
- (NSMutableArray<NSString *> *)arrayM{
    if (!_arrayM) {
        _arrayM = [NSMutableArray array];
    }
    return _arrayM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    self.navigationItem.title = @"订单备注";
    [self.tableView registerClass:[AFBCommentTopListCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"AFBCommentTopListCell"bundle:nil] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:footID];
    self.tableView.rowHeight = 100;
    UITableViewHeaderFooterView *footView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    self.tableView.tableFooterView = footView;
    
    //textview
    UITextView *textview = [[UITextView alloc] init];
    [footView addSubview:textview];
    self.textViewV = textview;
    textview.keyboardType = UIKeyboardTypeDefault;
    textview.font = [UIFont fontWithName:@"Arial" size:16];
    textview.delegate = self;

    
    //textView上的左上的UILabel
    UILabel *placehoderL = [[UILabel alloc] init];
    placehoderL.numberOfLines = 0;
    self.placehoder = placehoderL;
    [textview addSubview:placehoderL];
    placehoderL.textColor = [UIColor lightGrayColor];
    placehoderL.font = [UIFont systemFontOfSize:13];
    placehoderL.text = @"给商家留言,可输入对商家的需求(可不填)";
    //textView上的右下的UILabel
    UILabel *rightBtmL = [[UILabel alloc] init];
    [textview addSubview:rightBtmL];
    rightBtmL.text = @"300字以内";
    rightBtmL.font = [UIFont systemFontOfSize:13];
    rightBtmL.textColor = [UIColor lightGrayColor];
    
    //完成按钮
    UIButton *completeBtn = [[UIButton alloc] init];
    self.commitBtn = completeBtn;
    completeBtn.layer.cornerRadius = 10;
    completeBtn.layer.masksToBounds = YES;
    [footView addSubview:completeBtn];
    //默认状态的按钮
    [completeBtn setTitle:@"完成" forState:UIControlStateDisabled];
    [completeBtn setBackgroundImage:[UIImage imageNamed:@"shenhui"] forState:UIControlStateDisabled];
    [completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    //输入文字后的按钮
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completeBtn setBackgroundImage:[UIImage imageNamed:@"juhuang"] forState:UIControlStateNormal];
    [completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    completeBtn.enabled = NO;
    
    //设置分割线
    UIView * line = [UIView new];
    line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [footView addSubview:line];

    
    
    
//    [completeBtn addTarget:self action:@selector(clickComplete) forControlEvents:UIControlEventTouchUpInside];
    
    //布局
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(footView);
        make.height.mas_equalTo(0.5);
    }];
    [textview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_bottom);
        make.left.right.mas_equalTo(footView);
        make.height.mas_equalTo(200);
    }];
    [placehoderL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(8);
        make.top.mas_offset(12);
    }];
    [rightBtmL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-8);
        make.bottom.mas_offset(12);
    }];

    [completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footView);
        make.top.equalTo(textview.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(300, 44));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AFBCommentTopListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
- (void)AFBCommentTopListCellWithButton:(UIButton *)btn{
    if (![self.arrayM containsObject:btn.titleLabel.text]) {
        NSString *btnTitleStr = [btn currentTitle];
        if (_string == nil) {
            _string = btnTitleStr;
        }else{
        _string = [_string stringByAppendingString:[NSString stringWithFormat:@"   %@",btnTitleStr]];
        }
    }
    self.textViewV.text = _string;
//    self.placehoder.hidden = YES;
    [self textViewDidChange:self.textViewV];
    [self.arrayM addObject:btn.titleLabel.text];

}
//- (void)AFBCommentTopListCellWithString:(NSString *)string{
//    
//    if (![self.arrayM containsObject:string]) {
//        _string = [_string stringByAppendingString:string];
//        
//    }
//    self.textViewV.text = _string;
//    [self.arrayM addObject:string];
//    
//}

- (void)clickComplete{
    NSLog(@"点击了完成,别忘了回传哦");
    
    
}
//-(void)addObserver
//{
//    //开始编辑
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginediting:) name:UITextViewTextDidBeginEditingNotification object:self];
//    //停止编辑
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endediting:) name:UITextViewTextDidEndEditingNotification object:self];

//}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self.placehoder removeFromSuperview];
}

- (void)textViewDidChange:(UITextView *)textView{
    //隐藏self.placehoder.hidden = YES;
//
    
    
    if (textView.text.length == 0) {
        //长度为0的时候,占位符不隐藏;
        self.placehoder.hidden = NO;
        self.commitBtn.enabled = NO;
        
    }else{
//         self.commitBtn.userInteractionEnabled = YES;
        self.placehoder.hidden = YES;
        self.commitBtn.enabled = YES;
    }
    if (textView.text.length >= 300) {
        NSLog(@"输入的文字数量大于300");
    }
}

- (void)dealloc{
    NSLog(@"1");
    [_arrayM removeAllObjects];
}


//- (void)textViewDidEndEditing:(UITextView *)textView{
//    NSLog(@"2");
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
