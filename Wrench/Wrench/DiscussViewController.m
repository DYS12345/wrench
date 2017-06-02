//
//  DiscussViewController.m
//  Wrench
//
//  Created by dong on 2017/5/22.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "DiscussViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "SearchViewController.h"
#import "UIView+Extension.h"
#import "TechnicianTableViewCell.h"

@interface DiscussViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UIView *sortView;
@property(nonatomic, strong) UIButton *selectedButton;
@property(nonatomic, strong) UIView *maskView;
@property(nonatomic, strong) UIView *fieldView;
@property(nonatomic, strong) UITableView *discussTableView;

@end

@implementation DiscussViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithImage:@"Nav_Search" highImage:nil title:nil target:self action:@selector(searchClick)];
    self.navigationItem.rightBarButtonItem = searchItem;
    
    [self.view addSubview:self.sortView];
    [self.view addSubview:self.discussTableView];
}

-(UITableView *)discussTableView{
    if (!_discussTableView) {
        _discussTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.sortView.y+self.sortView.height+20, SCREEN_WIDTH, SCREEN_HEIGHT-_discussTableView.y-49) style:UITableViewStylePlain];
        _discussTableView.delegate = self;
        _discussTableView.dataSource = self;
        [_discussTableView registerClass:[TechnicianTableViewCell class] forCellReuseIdentifier:@"TechnicianTableViewCell"];
        _discussTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _discussTableView.showsVerticalScrollIndicator = NO;
        _discussTableView.backgroundColor = [UIColor colorWithHexString:@"#F1F1F1"];
        _discussTableView.rowHeight = 80;
    }
    return _discussTableView;
}

-(UIView *)sortView{
    if (!_sortView) {
        _sortView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
        _sortView.backgroundColor = [[UIColor colorWithPatternImage:[UIImage imageNamed:@"navi_bg"]] colorWithAlphaComponent:0.7];
        
        NSArray *titleAry = @[@"全部", @"擅长领域", @"距离"];
        // 内部的子标签
        CGFloat width = SCREEN_WIDTH / 3;
        CGFloat height = _sortView.height;
        for (NSInteger i = 0; i<3; i++) {
            UIButton *button = [[UIButton alloc] init];
            button.tag = i;
            button.height = height;
            button.width = width;
            button.x = i * width;
            [button setTitle:titleAry[i] forState:UIControlStateNormal];
            //      [button layoutIfNeeded]; // 强制布局(强制更新子控件的frame)
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [_sortView addSubview:button];
            
            // 默认点击了第一个按钮
            if (i == 0) {
                button.enabled = NO;
                self.selectedButton = button;
                
                // 让按钮内部的label根据文字内容来计算尺寸
                [button.titleLabel sizeToFit];
            }
        }
    }
    return _sortView;
}

-(UIView *)fieldView{
    if (!_fieldView) {
        _fieldView = [[UIView alloc] initWithFrame:CGRectMake(0, self.sortView.y+self.sortView.height, SCREEN_WIDTH, 0)];
        _fieldView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_fieldView];
    }
    return _fieldView;
}

-(void)titleClick:(UIButton*)button{
    // 修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    if (button.tag  == 1) {
        self.maskView.hidden = NO;
        [UIView animateWithDuration:0.25 animations:^{
            self.fieldView.height = 300;
        }];
    } else {
        self.maskView.hidden = YES;
        [UIView animateWithDuration:0.25 animations:^{
            self.fieldView.height = 0;
        }];
    }
}

-(UIView *)maskView{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, self.sortView.height, SCREEN_WIDTH, SCREEN_HEIGHT-_maskView.y)];
        _maskView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.6];
        [self.view addSubview:_maskView];
    }
    return _maskView;
}

-(void)searchClick{
    SearchViewController *search = [[SearchViewController alloc] init];
    [self presentViewController:search animated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TechnicianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TechnicianTableViewCell"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
