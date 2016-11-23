//
//  TopView.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/20.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "CellView.h"

@interface CellView()

@property (nonatomic, strong) NSArray *imgs;
@property (nonatomic, strong) NSArray *tts;

@end

@implementation CellView

+ (instancetype)setupTopViewWithImageStrings: (NSArray *)imageStrings andTitles:(NSArray *)titles {
    
    return [[self alloc] initWithImageStrings:imageStrings andTitles:titles];
}

- (instancetype)initWithImageStrings: (NSArray *)imageStrings andTitles:(NSArray *)titles
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        // 创建子控件
        float btnW = [UIScreen mainScreen].bounds.size.width / 4;
        for (int i = 0; i < imageStrings.count; i++) {
            UIButton *btn = [[UIButton alloc] init];
            [btn setAttributedTitle:[NSAttributedString ay_imageTextWithImage:[UIImage imageNamed:imageStrings[i]] imageWH:18.0 title:titles[i] fontSize:13 titleColor:[UIColor darkGrayColor] spacing:5] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i + 1;
            btn.titleLabel.numberOfLines = 0;
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:btn];
            
            // 约束
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self);
                make.size.width.offset(btnW);
                make.left.equalTo(self).offset(i * btnW);
            }];
        }
    }
    return self;
}


#pragma mark - 三个按钮的点击事件
- (void)clickBtn:(UIButton *)btn
{
    if ([_delegate respondsToSelector:@selector(btn:ofTopView:)]) {
        [_delegate btn:btn ofTopView:self];
    }
}

@end
