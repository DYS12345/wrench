//
//  HomeView.m
//  Wrench
//
//  Created by dong on 2017/5/26.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "HomeView.h"
#import "Const.h"
#import "SGTopTitleView.h"

@interface HomeView () <SGTopTitleViewDelegate>

@property (nonatomic, strong) SGTopTitleView *segmentedControl;
@property(nonatomic,strong) NSNumber *type;

@end

@implementation HomeView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.segmentedControl];
    }
    return self;
}

-(SGTopTitleView *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[SGTopTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        _segmentedControl.staticTitleArr = @[@"全部", @"未付款", @"待发货", @"待收货", @"待评价"];
        _segmentedControl.backgroundColor = [UIColor whiteColor];
        _segmentedControl.delegate_SG = self;
        [_segmentedControl staticTitleLabelSelecteded:_segmentedControl.allTitleLabel[[self.type intValue]]];
    }
    return _segmentedControl;
}

@end
