//
//  WNavigationController.m
//  Wrench
//
//  Created by dong on 2017/5/22.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "WNavigationController.h"

@interface WNavigationController ()

/**
 返回按钮
 */
@property (nonatomic , strong) UIButton * backBtn;

@end

@implementation WNavigationController

/**
 * 当第一次使用这个类的时候会调用一次
 */
+ (void)initialize
{
    // 当导航栏用在XMGNavigationController中, appearance设置才会生效
//        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navi_bg"] forBarMetrics:UIBarMetricsDefault];
    [bar setTranslucent:NO];
    [bar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:17]}];
    
        // 设置item
        UIBarButtonItem *item = [UIBarButtonItem appearance];
        // UIControlStateNormal
        NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
        itemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
        itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
        [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
        // UIControlStateDisabled
        NSMutableDictionary *itemDisabledAttrs = [NSMutableDictionary dictionary];
        itemDisabledAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
        [item setTitleTextAttributes:itemDisabledAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [button setTitle:@"返回" forState:UIControlStateNormal];
        [self.backBtn setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
        //        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        //        button.size = CGSizeMake(70, 30);
        // 让按钮内部的所有内容左对齐
        //        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.backBtn sizeToFit];
        // 让按钮的内容往左边偏移10
        //        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        //        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [self.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }  
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    return [super popViewControllerAnimated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
