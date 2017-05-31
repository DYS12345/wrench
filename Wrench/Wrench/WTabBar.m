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


@end
