//
//  AFBSecKillViewController.m
//  LoveFreshBeeSuper
//
//  Created by 王志华 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBSecKillViewController.h"

@interface AFBSecKillViewController ()

@property (nonatomic,weak) UIWebView * webView;

@end

@implementation AFBSecKillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{

    self.navigationItem.title = @"秒杀";
    
    [self.navigationController setNavigationBarHidden:NO];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIWebView * webView = [[UIWebView alloc] init];
    
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view);
    }];
    
    _webView = webView;
    
    [self loadWeb];
}

- (void)loadWeb{
    
    NSURL * url = [NSURL URLWithString:@"http://m.beequick.cn/show/active?id=20333&locationHash=b146d3x+aiKpFadVCXC8qKnvXJCNZvJTvO7fpxjIyClVRx9WEryjH6bEk&zchtid=10309&location_time=1453779210&show_reload=1&hide_cart=0&activitygroup=miaoshav3&name=%E7%A7%92%E6%9D%80&bigids=2%2C0&cityid=2&addrid=4825569&zchtauth=0660c8G2eHuPa14mhxZ%252FCS4sObBfhTVY9vm1%252BSnWminqivhA&__v=ios4.10&__d=d14ryS0MFUAhfrQ6rPJ9Gziisg%2F9Cf8CxgkzZw5AkPMbPcbv%2BpM4HpDJlnwAZPd5UyoGA15VrRjghCP%2BV9aEPxujif%2BZz%2BiQj0VnrKSqi2WPtoDqawuVqcnYqE98x14eK17f"];
    
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
