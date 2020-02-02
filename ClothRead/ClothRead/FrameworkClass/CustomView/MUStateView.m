//
//  MCStateView.m
//  MeicaiStore
//
//  Created by mc962 on 15/10/20.
//

#import "MUStateView.h"

#define kMCStateViewFirstSpace  15.0f
#define kMCStateViewSecondSpace 30.0f

@interface MUStateView ()
/**
 *  图片下方的文字
 */
@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * woTitleLabel;
/**
 *  显示的图片
 */
@property (nonatomic, strong) UIImageView * imageView;
/**
 *  点击按钮
 */
@property (nonatomic, strong) UIButton * stateButton;
@end

@implementation MUStateView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:20.0f];
        _titleLabel.textColor = [UIColor whiteColor];

        _woTitleLabel = [UILabel new];
        _woTitleLabel.font = [UIFont systemFontOfSize:20.0f];
        _woTitleLabel.textColor = [UIColor whiteColor];

        self.imageView = [[UIImageView alloc] init];
        self.imageView.userInteractionEnabled = YES;

        [self addSubview:_titleLabel];
        [self addSubview:_woTitleLabel];
        [self addSubview:self.imageView];

        _stateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _stateButton.backgroundColor = [UIColor clearColor];
        _stateButton.enabled = YES;
        
    }
    return self;
}
-(void)layoutUI{
    
    _titleLabel.numberOfLines = 1;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _woTitleLabel.numberOfLines = 1;
    _woTitleLabel.textAlignment = NSTextAlignmentCenter;

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.offset(62*SCREEN_Proportion);
        make.height.offset(48*SCREEN_Proportion);
    }];

    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
           make.centerX.equalTo(_imageView.mas_centerX);
           make.width.lessThanOrEqualTo(@(SCREENW-70));
           make.bottom.equalTo(_imageView.mas_top).offset(-25);
       }];
    [_woTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_titleLabel.mas_centerX);
        make.width.lessThanOrEqualTo(@(SCREENW-70));
        make.bottom.equalTo(_titleLabel.mas_top).offset(-23);
    }];

    [self.imageView addSubview:_stateButton];
    [_stateButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.offset(-20);
        make.right.and.bottom.offset(20);

    }];
    [_stateButton addTarget:self action:@selector(stateButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)updateImage:(UIImage *)img andText:(NSString *)text andTwoText:(NSString *)twoText andButtonText:(NSString *)buttonText andButtonType:(MUStateViewButtonType)type
{
    _type = type;
    if (img)
    {
       _imageView.image = img;
    }
    else
    {
        switch (type)
        {
            case MUStateViewButtonTypeNoData:
            {
                img = [UIImage imageNamed:@"img_slowspeed"];
                _imageView.image = img;
            }
                break;
            case MUStateViewButtonTypeNoNetwork:
            {
                img = [UIImage imageNamed:@"img_nonetwork"];
                _imageView.image = img;
            }
                break;
            case MUStateViewButtonTypeLogin:
            {
                img = [UIImage imageNamed:@"img_notloggedin"];
                _imageView.image = img;
            }
                break;
            default:
                break;
        }
    }
    
    if (STRING(text).length > 0 && STRING(twoText).length > 0) {
        _titleLabel.text = text;
        _woTitleLabel.text = twoText;
        _woTitleLabel.hidden = NO;
        _titleLabel.hidden = NO;
        [MUObjectTool changeSpaceForLabel:_titleLabel withLineSpace:10 WordSpace:3];
        [MUObjectTool changeSpaceForLabel:_woTitleLabel withLineSpace:10 WordSpace:3];
    }else{
        _titleLabel.hidden = YES;
        _woTitleLabel.hidden = YES;
    }
    
    if (STRING(text).length > 0 && STRING(twoText).length > 0) {
        [_stateButton setHidden:NO];
    }else{
        [_stateButton setHidden:YES];
    }
    [self layoutUI];
    self.hidden = NO;
}

-(void)stateButtonClicked{
    if ([_delegate respondsToSelector:@selector(dlStateButtonClicked:)]){
        [_delegate dlStateButtonClicked:_type];
    }
}

-(void)hide{
    self.hidden = YES;
    [self hideLoadingView];
}

-(void)showMCLoadingViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText{
    [[MCLoadingView shareMCLoadingView] showMCLoadingViewTopSpace:topSpace andBottomSpace:bottomSpace andText:labelText];
    _titleLabel.hidden = YES;
    _woTitleLabel.hidden = YES;
    _stateButton.hidden = YES;
    _imageView.image = nil;
}

-(void)hideLoadingView{
    [[MCLoadingView shareMCLoadingView] stopMCLoadingView];
}
@end
