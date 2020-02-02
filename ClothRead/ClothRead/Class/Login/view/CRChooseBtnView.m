//
//  CRChooseBtnView.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/29.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRChooseBtnView.h"

@implementation CRChooseBtnView

- (instancetype)init{
    if (self == [super init]) {
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.offset(0);
            make.height.offset(32*SCREEN_Proportion);
        }];
        
        [self addSubview:self.bottomView];
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.offset(0);
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.height.offset(2*SCREEN_Proportion);
        }];
        
        [self addSubview:self.coverBtn];
        [self.coverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.and.bottom.offset(0);
        }];
    }
    return self;
}

// set&get
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14*SCREEN_Proportion];
        [_titleLabel setTextColor:[UIColor colorWithHexString:@"4B4949"]];
    }
    return _titleLabel;
}
- (UIView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor colorWithHexString:@"FFD12A"];
    }
    return _bottomView;
}
- (UIButton *)coverBtn{
    if (_coverBtn == nil) {
        _coverBtn = [[UIButton alloc]init];
        _coverBtn.backgroundColor = [UIColor clearColor];
    }
    return _coverBtn;
}

@end
