//
//  TechnicianTableViewCell.m
//  Wrench
//
//  Created by dong on 2017/6/2.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "TechnicianTableViewCell.h"
#import "Masonry.h"
#import "UIColor+Extension.h"
#import "TechnicianChatViewController.h"

@interface TechnicianTableViewCell ()

@property(nonatomic, strong) UIImageView *headPortraitImageView;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *brandLabel;
@property(nonatomic, strong) UIView *lineView;
@property(nonatomic, strong) UILabel *distanceLabel;
@property(nonatomic, strong) UIImageView *distanceImageView;
@property(nonatomic, strong) UIImageView *envelopeImageView;

@end

@implementation TechnicianTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.headPortraitImageView];
        [self.headPortraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(0);
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(15);
            make.width.height.mas_equalTo(40);
        }];
        
        [self.contentView addSubview:self.brandLabel];
        [self.brandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headPortraitImageView.mas_right).mas_offset(10);
            make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(0);
        }];
        
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.brandLabel.mas_left).mas_offset(0);
            make.bottom.mas_equalTo(self.brandLabel.mas_top).mas_offset(-5);
        }];
        
        [self.contentView addSubview:self.distanceLabel];
        [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.brandLabel.mas_left).mas_offset(0);
            make.top.mas_equalTo(self.brandLabel.mas_bottom).mas_offset(5);
        }];
        
        [self.contentView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.contentView).mas_offset(0);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(0);
            make.height.mas_equalTo(1);
        }];
        
        [self.contentView addSubview:self.distanceImageView];
        [self.distanceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.distanceLabel.mas_right).mas_offset(5);
            make.centerY.mas_equalTo(self.distanceLabel.mas_centerY).mas_offset(0);
        }];
        
        [self.contentView addSubview:self.envelopeImageView];
        [self.envelopeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
            make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(0);
            make.height.mas_equalTo(32/2*1.5);
            make.width.mas_equalTo(45/2*1.5);
        }];
    }
    return self;
}

-(UIImageView *)envelopeImageView{
    if (!_envelopeImageView) {
        _envelopeImageView = [[UIImageView alloc] init];
        _envelopeImageView.image = [UIImage imageNamed:@"envelope"];
        _envelopeImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap33 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chatClick)];
        singleTap33.numberOfTouchesRequired = 1; //手指数
        singleTap33.numberOfTapsRequired = 1; //tap次数
        singleTap33.delegate= self;
        _envelopeImageView.contentMode = UIViewContentModeScaleToFill;
        [_envelopeImageView addGestureRecognizer:singleTap33];
    }
    return _envelopeImageView;
}

-(void)chatClick{
    TechnicianChatViewController *vc = [[TechnicianChatViewController alloc] init];
    [self.nav pushViewController:vc animated:YES];
}

-(UIImageView *)distanceImageView{
    if (!_distanceImageView) {
        _distanceImageView = [[UIImageView alloc] init];
        _distanceImageView.image = [UIImage imageNamed:@"icon_map"];
    }
    return _distanceImageView;
}

-(UILabel *)distanceLabel{
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc] init];
        _distanceLabel.font = [UIFont systemFontOfSize:13];
        _distanceLabel.text = @"5km";
    }
    return _distanceLabel;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    }
    return _lineView;
}

-(UILabel *)brandLabel{
    if (!_brandLabel) {
        _brandLabel = [[UILabel alloc] init];
        _brandLabel.font = [UIFont systemFontOfSize:13];
        _brandLabel.text = @"大众 丰田";
    }
    return _brandLabel;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"王xx 工龄 5年  机修";
    }
    return _nameLabel;
}

-(UIImageView *)headPortraitImageView{
    if (!_headPortraitImageView) {
        _headPortraitImageView = [[UIImageView alloc] init];
        _headPortraitImageView.layer.masksToBounds = YES;
        _headPortraitImageView.layer.cornerRadius = 20;
        _headPortraitImageView.layer.borderWidth = 1;
        _headPortraitImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _headPortraitImageView;
}

@end
