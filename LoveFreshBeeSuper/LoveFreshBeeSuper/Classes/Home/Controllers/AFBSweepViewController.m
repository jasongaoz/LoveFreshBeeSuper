//
//  AFBSweepViewController.m
//  LoveFreshBeeSuper
//
//  Created by 王志华 on 2016/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBSweepViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AFBSweepViewController () <AVCaptureMetadataOutputObjectsDelegate>
{
    int number;
    NSTimer *timer;
    NSInteger _count;
    BOOL upOrdown;
    AVCaptureDevice *lightDevice;
}

@property (nonatomic,strong) UIView *centerView;//扫描的显示视图

/**
 * 二维码扫描参数
 */
@property (strong,nonatomic) AVCaptureDevice *device;
@property (strong,nonatomic) AVCaptureDeviceInput *input;
@property (strong,nonatomic) AVCaptureMetadataOutput *output;
@property (strong,nonatomic) AVCaptureSession *session;
@property (strong,nonatomic) AVCaptureVideoPreviewLayer *preview;
@property (nonatomic,retain) UIImageView *imageView;//扫描线

- (void)setupCamera;
- (void)stopReading;

@end

@implementation AFBSweepViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_session && ![_session isRunning]) {
        [_session startRunning];
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0075 target:self selector:@selector(scanningAnimation) userInfo:nil repeats:YES];
    [self setupCamera];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"扫一扫";
    [self.navigationController setNavigationBarHidden:NO];
    self.view.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _count = 0 ;
    //初始化闪光灯设备
    lightDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //扫描范围
    _centerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    _centerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_centerView];
    
    //扫描的视图加载
    UIView *scanningViewOne = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    scanningViewOne.backgroundColor= [[UIColor blackColor] colorWithAlphaComponent:0.4];
    [self.centerView addSubview:scanningViewOne];
    
    UIView *scanningViewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, 120, (self.view.frame.size.width-300)/2, 300)];
    scanningViewTwo.backgroundColor= [[UIColor blackColor] colorWithAlphaComponent:0.4];
    [self.centerView addSubview:scanningViewTwo];
    
    UIView *scanningViewThree = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2+150, 120, (self.view.frame.size.width-300)/2, 300)];
    scanningViewThree.backgroundColor= [[UIColor blackColor] colorWithAlphaComponent:0.4];
    [self.centerView addSubview:scanningViewThree];
    
    UIView *scanningViewFour = [[UIView alloc]initWithFrame:CGRectMake(0, 420, self.view.frame.size.width,CGRectGetHeight(self.view.frame)- 420)];
    scanningViewFour.backgroundColor= [[UIColor blackColor] colorWithAlphaComponent:0.4];
    [self.centerView addSubview:scanningViewFour];
    
    
    UILabel *labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(15, 430, self.view.frame.size.width - 30, 30)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.textAlignment = NSTextAlignmentCenter;
    labIntroudction.textColor = [UIColor whiteColor];
    labIntroudction.text = @"请将二维码放入扫描框内";
    [self.centerView addSubview:labIntroudction];
    
    UIButton *openLight = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2-25, 470, 50, 50)];
    [openLight setImage:[UIImage imageNamed:@"闪光"] forState:UIControlStateNormal];
    [openLight setImage:[UIImage imageNamed:@"关灯"] forState:UIControlStateSelected];
    [openLight addTarget:self action:@selector(openLightWay:) forControlEvents:UIControlEventTouchUpInside];
    [self.centerView addSubview:openLight];
    
    //扫描线
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2-110, 130, 220, 5)];
    _imageView.image = [UIImage imageNamed:@"黄线"];
    [self.centerView addSubview:_imageView];
}

- (void)viewWillDisappear:(BOOL)animated {
    _count= 0;
    [timer invalidate];
    [self stopReading];
}


#pragma mark -- 设置参数
- (void)setupCamera {
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//        
//        _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:nil];
//        
//        _output = [[AVCaptureMetadataOutput alloc]init];
//        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
//        
//        
//        _session = [[AVCaptureSession alloc]init];
//        [_session setSessionPreset:AVCaptureSessionPresetHigh];
//        if ([_session canAddInput:self.input])
//        {
//            [_session addInput:self.input];
//        }
//        
//        if ([_session canAddOutput:self.output])
//        {
////            [_session addOutput:self.output];
//        }
//        
//        // 条码类型 AVMetadataObjectTypeQRCode
//        _output.metadataObjectTypes = [NSArray arrayWithObjects:AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeQRCode, nil];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //更新界面
//            _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
//            _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
//            _preview.frame = CGRectMake(0, 0, CGRectGetWidth(self.centerView.frame), CGRectGetHeight(self.centerView.frame));
//            [self.centerView.layer insertSublayer:self.preview atIndex:0];
//            [_session startRunning];
//        });
//    });
}

//扫描动画
- (void)scanningAnimation {
    if (upOrdown == NO) {
        number ++;
        _imageView.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2-115, 130+2*number, 230, 5);
        if (2*number == 280) {
            upOrdown = YES;
        }
    }
    else {
        number --;
        _imageView.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2-115, 130+2*number, 230, 5);
        if (number == 0) {
            upOrdown = NO;
        }
    }
}

- (void)stopReading {
    [_session stopRunning];
    _session = nil;
    [_preview removeFromSuperlayer];
    [timer invalidate];
    timer = nil ;
}

-(void)openLightWay:(UIButton *)sender {
    
    if (![lightDevice hasTorch]) {//判断是否有闪光灯
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"当前设备没有闪光灯，不能提供手电筒功能" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        [lightDevice lockForConfiguration:nil];
        [lightDevice setTorchMode:AVCaptureTorchModeOn];
        [lightDevice unlockForConfiguration];
    }
    else
    {
        [lightDevice lockForConfiguration:nil];
        [lightDevice setTorchMode: AVCaptureTorchModeOff];
        [lightDevice unlockForConfiguration];
    }
}

#pragma mark -- AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    
    NSString *stringValue;
    if ([metadataObjects count] >0){
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        NSLog(@"%@",stringValue);
    }
    [_session stopRunning];
    [timer invalidate];
    _count ++ ;
    [self stopReading];
    if (stringValue && _count == 1) {
        //扫描完成
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
