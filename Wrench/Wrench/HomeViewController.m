//
//  HomeViewController.m
//  Wrench
//
//  Created by dong on 2017/5/22.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "HomePresenter.h"

@interface HomeViewController ()

@property(nonatomic, strong) HomeView *customView;
@property(nonatomic, strong) HomePresenter *presenter;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.presenter = [[HomePresenter alloc] init];
}

-(void)loadView{
    [super loadView];
    self.customView = [[HomeView alloc] init];
    self.view = self.customView;
}

@end
