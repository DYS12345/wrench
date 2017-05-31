//
//  HomeView.m
//  Wrench
//
//  Created by dong on 2017/5/26.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "HomeView.h"
#import "Const.h"
#import "Masonry.h"

@interface HomeView ()

@property(nonatomic, strong) UIView *segView;
@property(nonatomic,strong) NSNumber *type;
@property(nonatomic,strong) UIButton *recommendedBtn;
//@property(nonatomic,strong) UIButton *recommendedBtn;

@end

@implementation HomeView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.segView];
    }
    return self;
}

-(UIView *)segView{
    if (_segView == nil) {
        _segView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 30)];
        _segView.backgroundColor = [UIColor redColor];
        
        self.recommendedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.recommendedBtn setFont:[UIFont systemFontOfSize:14]];
        [self.recommendedBtn setTitle:@"推荐" forState:UIControlStateNormal];
        [self.recommendedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.recommendedBtn.contentMode = UIViewContentModeCenter;
        [_segView addSubview:self.recommendedBtn];
        [self.recommendedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo((SCREEN_WIDTH-30)/3);
            make.height.mas_equalTo(30);
            make.left.mas_equalTo(_segView.mas_left).mas_offset(0);
            make.top.mas_equalTo(_segView.mas_top).mas_offset(0);
        }];
    }
    return _segView;
}

@end
