//
//  WTabbarViewController.m
//  Wrench
//
//  Created by dong on 2017/5/22.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "WTabbarViewController.h"
#import "UIColor+Extension.h"
#import "HomeViewController.h"
#import "DiscussViewController.h"
#import "AccessoriesViewController.h"
#import "MyViewController.h"
#import "WNavigationController.h"
#import "WTabBar.h"

@interface WTabbarViewController ()

@end

@implementation WTabbarViewController

+(WTabbarViewController *)sharedManager{
    static WTabbarViewController *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#666666"];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#222222"];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self setupChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"tabBar_Home" selectedImage:@"homered"];
    
    [self setupChildVc:[[DiscussViewController alloc] init] title:@"我的技师" image:@"tabBar_Discover" selectedImage:@"findred"];
    
    [self setupChildVc:[[AccessoriesViewController alloc] init] title:@"我的库房" image:@"tabBar_Mall" selectedImage:@"shopred"];
    
    [self setupChildVc:[[MyViewController alloc] init] title:@"我的" image:@"tabBar_MyCenter" selectedImage:@"minered"];
    
    // 更换tabBar
    [self setValue:[[WTabBar alloc] init] forKeyPath:@"tabBar"];
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    WNavigationController *nav = [[WNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
