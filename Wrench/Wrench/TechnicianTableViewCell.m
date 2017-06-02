//
//  TechnicianTableViewCell.m
//  Wrench
//
//  Created by dong on 2017/6/2.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "TechnicianTableViewCell.h"
#import "Masonry.h"

@interface TechnicianTableViewCell ()

@property(nonatomic, strong) UIImageView *headPortraitImageView;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *brandLabel;

@end

@implementation TechnicianTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headPortraitImageView];
        [self.headPortraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(0);
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(15);
            make.width.height.mas_equalTo(40);
        }];
        
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headPortraitImageView.mas_right).mas_offset(10);
            make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        }];
        
        [self.contentView addSubview:self.brandLabel];
        [self.brandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLabel.mas_left).mas_offset(0);
            make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset(5);
        }];
    }
    return self;
}

-(UILabel *)brandLabel{
    if (!_brandLabel) {
        _brandLabel = [[UILabel alloc] init];
        _brandLabel.font = [UIFont systemFontOfSize:14];
        _brandLabel.text = @"大众 丰田";
    }
    return _brandLabel;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"王xx 工龄 5年  机修";
    }
    return _nameLabel;
}

-(UIImageView *)headPortraitImageView{
    if (!_headPortraitImageView) {
        _headPortraitImageView = [[UIImageView alloc] init];
        _headPortraitImageView.layer.masksToBounds = YES;
        _headPortraitImageView.layer.cornerRadius = 20;
    }
    return _headPortraitImageView;
}

@end
