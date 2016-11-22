//
//  AFBDrawViewController.m
//  LoveFreshBeeSuper
//
//  Created by 王志华 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBDrawViewController.h"

#import <Masonry.h>

@interface AFBDrawViewController ()

@property (nonatomic,weak) UIWebView * webView;

@end

@implementation AFBDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{

    self.navigationItem.title = @"抽奖";

    [self.navigationController setNavigationBarHidden:NO];
    
//    self.view.backgroundColor = [UIColor greenColor];
    
    UIWebView * webView = [[UIWebView alloc] init];
    
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view);
    }];
    
    _webView = webView;
    
    [self loadWeb];
}

- (void)loadWeb{

    NSURL * url = [NSURL URLWithString:@"http://m.beequick.cn/show/active?id=20206&locationHash=7ca258Avt44fDvvj2cZdEGf4nzjyAg95fITJXcnfccCKbDJW6SdFHgelg&zchtid=10309&location_time=1453779210&show_reload=1&hide_cart=1&activitygroup=zhuanpan&name=%E6%8A%BD%E5%A5%96&bigids=2%2C0&cityid=2&addrid=4825569&zchtauth=0660c8G2eHuPa14mhxZ%252FCS4sObBfhTVY9vm1%252BSnWminqivhA&__v=ios4.10&__d=d14ryS0MFUAhfrQ6rPJ9Gziisg%2F9Cf8CxgkzZw5AkPMbPcbv%2BpM4HpDJlnwAZPd5UyoGA15VrRjnhCT8VdSGZRr1hqySmO%2FA2k1rqKaujWCJ69O%2BOlzJ%2FM3c%2BEAqx14eK17f"];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if (connectionError) {
            NSLog(@"%@",connectionError);
        }
        
        NSString * urlString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        [_webView loadHTMLString:urlString baseURL:url];
    }];
}

@end
