//
//  WTabBar.m
//  Wrench
//
//  Created by dong on 2017/5/22.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "WTabBar.h"
#import "UIColor+Extension.h"
#import "Const.h"
#import "UIView+Extension.h"

@interface WTabBar()

/** 发布按钮 */
@property (nonatomic, strong) UIButton *releaseBtn;

@end

@implementation WTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.frame = CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49);
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithHexString:@"#8a98a9"], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    }
    return self;
}

-(UIButton *)releaseBtn{
    if (_releaseBtn == nil) {
        _releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_releaseBtn setImage:[UIImage imageNamed:@"equipment"] forState:(UIControlStateNormal)];
        [_releaseBtn addTarget:self action:@selector(releaseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _releaseBtn.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8" alpha:1];
    }
    return _releaseBtn;
}

-(void)releaseBtnClick:(UIButton*)sender{

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    
    // 设置其他UITabBarButton的frame
    CGFloat buttonX = 0;
    CGFloat buttonY = -2;
    CGFloat buttonW = width / (self.items.count + 1);
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIControl *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.releaseBtn) continue;
        
        // 计算按钮的x值
        buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
    
    self.releaseBtn.frame = CGRectMake(buttonX, buttonY, 50, 50);
    self.releaseBtn.layer.cornerRadius = 50 / 2;
    self.releaseBtn.center = CGPointMake(width * 0.5, height * 0.25);
    
    [self addSubview:self.releaseBtn];
}

@end
