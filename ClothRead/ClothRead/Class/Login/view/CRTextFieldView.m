//
//  CRTextFieldView.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRTextFieldView.h"

@implementation CRTextFieldView

- (void)setIsLockView:(BOOL)isLockView{
    [self addSubview:self.leftImageView];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(15*SCREEN_Proportion);
        make.height.offset(isLockView == 1 ? 16*SCREEN_Proportion : 20*SCREEN_Proportion);
        make.left.offset(15*SCREEN_Proportion);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.leftImageView.mas_right).offset(10*scale_width);
        make.height.equalTo(self.leftImageView.mas_height).offset(10*scale_height);
        make.width.offset(160*scale_width);
    }];
}

- (void)setPlaceholderStr:(NSString *)placeholderStr{
    NSString *holderText = @"请输入手机号";
    if (placeholderStr.length > 0 && placeholderStr != nil) {
        holderText = placeholderStr;
    }
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    [placeholder addAttributes: @{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, holderText.length)];
    [placeholder addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15*scale_width] range:NSMakeRange(0, holderText.length)];
    [placeholder addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"636374"] range:NSMakeRange(0, holderText.length)];
    self.textField.attributedPlaceholder = placeholder;
}

- (UITextField *)textField{
    if (_textField == nil) {
        _textField = [[UITextField alloc]init];
        _textField.font = [UIFont systemFontOfSize:17*scale_width];
        [_textField setTextColor:[UIColor whiteColor]];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _textField;
}

- (UIImageView *)leftImageView{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc]init];
    }
    return _leftImageView;
}

@end
