//
//  CRLunchImageView.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRLunchImageView.h"

@implementation CRLunchImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"login_backgroundImage"];
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    [self addSubview:self.contentTitle];
    [self.contentTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(ankedIPhone8 > 20 ? 162*SCREEN_Proportion : 108*SCREEN_Proportion);
        make.left.equalTo(self.mas_left).offset(75*SCREEN_Proportion);
        make.right.equalTo(self.mas_right).offset(-75*SCREEN_Proportion);
        make.height.offset(23*SCREEN_Proportion);
    }];
    
    [self addSubview:self.contentImageView];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.offset(145*SCREEN_Proportion);
        make.height.offset(106*SCREEN_Proportion);
    }];
}

- (UIImageView *)contentImageView{
    if (_contentImageView == nil) {
        _contentImageView = [[UIImageView alloc]init];
    }
    return _contentImageView;
}

- (UIImageView *)contentTitle{
    if (_contentTitle == nil) {
        _contentTitle = [[UIImageView alloc]init];
    }
    return _contentTitle;
}

@end
