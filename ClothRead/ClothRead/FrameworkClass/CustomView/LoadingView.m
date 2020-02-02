//
//  LoadingView.m
//  MeicaiStore
//
//  Created by 是个好孩子 on 15/5/7.
//

#import "LoadingView.h"

/*********************************   MCLoadingView   *********************************************/

#define MCLoadingViewBGWidth 130.0f
#define MCLoadingViewBGHeight 130.0f


#define MCLoadingViewBGNoTextWidth 80.0f
#define MCLoadingViewBGNoTextHeight 80.0f



@implementation LoadingView

-(instancetype)init
{
    if (self = [super init])
    {
        UIWindow * window = [MUKitTool getMainWindow];
        self.backgroundColor = [UIColor clearColor];
        self.frame = window.bounds;
        [window addSubview:self];
    }
    return self;
}

-(void)exchangeNewMainWindow
{
    [self removeFromSuperview];
    UIWindow * window = [MUKitTool getMainWindow];
    self.backgroundColor = [UIColor clearColor];
    self.frame = window.bounds;
    [window addSubview:self];
    self.hidden = YES;
}

@end


@interface MCPayLoadingView ()

// 背景View
@property (nonatomic, strong) UIView *backGroundView;

/** 全局属性 */
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

/** label */
@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UIActivityIndicatorView * activity;

@end

@implementation MCPayLoadingView

+ (instancetype)sharedCustomerLoaing{
    static MCPayLoadingView * payMCLoadingView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        payMCLoadingView = [[MCPayLoadingView alloc] init];
        payMCLoadingView.frame = CGRectMake(0, 0, SCREENW, SCREENH);
    });
    return payMCLoadingView;
}

-(void)showMCLoadingViewAndText:(NSString *)labelText{
    
    if (_backGroundView == nil) {
        
        UIView * bgView = [[UIView alloc] init];
        bgView.frame = self.frame;
        bgView.backgroundColor = [UIColor lightGrayColor];
        bgView.alpha = 0;
        _backGroundView = bgView;
        
        [self addSubview:_backGroundView];
    }
    
    if (_shapeLayer == nil) {
        
        UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] init];
        activity.center = _backGroundView.center;
        activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [_backGroundView addSubview:activity];
        _activity = activity;
        
//        // 创建CAShapeLayer
//        _shapeLayer = [CAShapeLayer layer];
//        _shapeLayer.frame = CGRectMake(0, 0, 50, 50);
//        // 位置
//        _shapeLayer.position = _backGroundView.center;
//        // 填充颜色
//        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
//        
//        // 设置线条的宽度和颜色
//        _shapeLayer.lineWidth = 3.0f;
//        _shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
//        
//        
//        // 起始位置和终点位置
//        _shapeLayer.strokeStart = 0.25;
//        _shapeLayer.strokeEnd = 1;
//        
//        // 创建出圆形贝塞尔曲线
//        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 50)];
//        
//        // 让贝塞尔曲线和CAShapeLaper关联
//        _shapeLayer.path = circlePath.CGPath;
//        
//        // 显示
//        [self.layer insertSublayer:_shapeLayer above:_backGroundView.layer];
//        
//        CABasicAnimation* rotationAnimation;
//        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
//        rotationAnimation.duration = 1.0;
//        rotationAnimation.cumulative = YES;
//        rotationAnimation.repeatCount = NSIntegerMax;
//        
//        [_shapeLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
    
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.frame = CGRectMake((SCREENW - 180)*0.5, CGRectGetMaxY(_activity.frame) + 25,180, 30);
        _contentLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor whiteColor];
        _contentLabel.text = labelText;
        if (labelText.length > 0) {
            _contentLabel.hidden = NO;
        }else{
            _contentLabel.hidden = YES;
        }
        [self insertSubview:_contentLabel aboveSubview:_backGroundView];
    }
    
    [_activity startAnimating];
    self.hidden = NO;
    [UIView animateWithDuration:0.000001 animations:^{
        
        self->_backGroundView.alpha = 0.85;
    } completion:^(BOOL finished) {
        
        [[[UIApplication sharedApplication].windows objectAtIndex:0] insertSubview:self atIndex:INT32_MAX];
    }];
    
}

- (void)stopLoadView{
    
    _backGroundView.alpha = 0.85;
    
    [UIView animateWithDuration:5.0 delay:1000 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
    } completion:^(BOOL finished) {
       
        [UIView animateWithDuration:4 delay:1000 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
        }completion:^(BOOL finished) {
            [self->_activity stopAnimating];
            self->_backGroundView.alpha = 0.0;
            self.hidden = YES;
        }];

    }];
}

@end

@interface MCLoadingView ()
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic, strong) UIView * bgViewAnimate;
@property (nonatomic, strong) UIActivityIndicatorView * activity;

@end

@implementation MCLoadingView
{
    UIImageView *loadImageView;
    NSInteger index;
    CGSize  imageSize;
    CGFloat imageLeftSpace;
    NSTimer *timer;
}
+(instancetype)shareMCLoadingView
{
    static MCLoadingView * customMCLoadingView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        customMCLoadingView = [[MCLoadingView alloc] init];
    });
    return customMCLoadingView;
}

-(void)showMCLoadingView:(CGFloat)topSpace andText:(NSString *)labelText
{
    loadImageView.hidden = YES;
    _activity.hidden = NO;
    if (_bgView == nil)
    {
        UIView * bgView = [[UIView alloc] init];
        bgView.frame = CGRectMake((SCREENW - MCLoadingViewBGWidth)/2, (SCREENH - MCLoadingViewBGHeight)/2, MCLoadingViewBGWidth, MCLoadingViewBGHeight);
        bgView.backgroundColor = [UIColor clearColor];
        bgView.layer.masksToBounds = YES;
        bgView.layer.cornerRadius = 5;
        _bgView = bgView;
        
        [self addSubview:_bgView];
      
    }
    
    
    if (_activity == nil)
    {
        UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] init];
        activity.center = _bgView.center;
        activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [_bgView addSubview:activity];
        _activity = activity;
    }
    
    if (_contentLabel == nil)
    {
        _contentLabel = [[MULabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14.0f];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor whiteColor];
        [_bgView addSubview:_contentLabel];
    }
    
    _contentLabel.text = labelText;
    
    self.frame = CGRectMake(kGetX(self), topSpace, kGetWidth(self), SCREENH - topSpace);
    _bgView.frame = CGRectMake((kGetWidth(self) - kGetWidth(_bgView))/2, (kGetHeight(self) - kGetHeight(_bgView))/2, kGetWidth(_bgView), kGetHeight(_bgView));
    
    if (labelText == nil)
    {
        _bgView.frame = CGRectMake((self.width - 80)/2, (self.height - 80)/2, 80, 80);
        _activity.center = CGPointMake(_bgView.frame.size.width/2, _bgView.frame.size.height/2);
        _contentLabel.hidden = YES;
        
    }
    else
    {
        _activity.center = CGPointMake(_bgView.frame.size.width/2, _bgView.frame.size.height/2 - 15);
        _contentLabel.hidden = NO;
        _contentLabel.frame = CGRectMake(0, _activity.frame.origin.y + _activity.frame.size.height + 15, _bgView.frame.size.width, _bgView.frame.size.height - _activity.frame.origin.y - _activity.frame.size.height);
    }
    
    [_activity startAnimating];
    
    self.hidden = NO;
}

-(void)showMCLoadingViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText
{
    loadImageView.hidden = YES;
    _activity.hidden = NO;
    if (_bgView == nil)
    {
        UIView * bgView = [[UIView alloc] init];
        bgView.frame = CGRectMake((SCREENW - MCLoadingViewBGWidth)/2, (SCREENH - MCLoadingViewBGHeight)/2, MCLoadingViewBGWidth, MCLoadingViewBGHeight);
        bgView.backgroundColor = MUSColor(0, 0, 0, 0.64);
        bgView.layer.masksToBounds = YES;
        bgView.layer.cornerRadius = 5;
        _bgView = bgView;
        
        [self addSubview:_bgView];
    }
    
    if (_activity == nil)
    {
        UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] init];
        activity.center = _bgView.center;
        activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [_bgView addSubview:activity];
        _activity = activity;
    }
    
    if (_contentLabel == nil)
    {
        _contentLabel = [[MULabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:14.0f];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor whiteColor];
        [_bgView addSubview:_contentLabel];
    }
    
    _contentLabel.text = labelText;
    
    self.frame = CGRectMake(kGetX(self), topSpace, kGetWidth(self), SCREENH - topSpace - bottomSpace);
    _bgView.frame = CGRectMake((kGetWidth(self) - kGetWidth(_bgView))/2, (kGetHeight(self) - kGetHeight(_bgView))/2, kGetWidth(_bgView), kGetHeight(_bgView));
    
    if (labelText == nil)
    {
        _bgView.frame = CGRectMake((self.width - 80)/2, (self.height - 80)/2, 80, 80);
        _activity.center = CGPointMake(_bgView.frame.size.width/2, _bgView.frame.size.height/2);
        _contentLabel.hidden = YES;
        
    }
    else
    {
        _activity.center = CGPointMake(_bgView.frame.size.width/2, _bgView.frame.size.height/2 - 15);
        _contentLabel.hidden = NO;
        _contentLabel.frame = CGRectMake(0, _activity.frame.origin.y + _activity.frame.size.height + 15, _bgView.frame.size.width, _bgView.frame.size.height - _activity.frame.origin.y - _activity.frame.size.height);
    }
    
    [_activity startAnimating];
    
    _bgView.hidden = NO;
    self.hidden = NO;
    [[MUKitTool getMainWindow] insertSubview:self atIndex:INT32_MAX];
}

-(void)showMCLoadingViewforGrayTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText
{
    loadImageView.hidden = YES;
    _activity.hidden = NO;
    if (_bgView == nil)
    {
        UIView * bgView = [[UIView alloc] init];
        bgView.frame = CGRectMake((SCREENW - MCLoadingViewBGWidth)/2, (SCREENH - MCLoadingViewBGHeight)/2, MCLoadingViewBGWidth, MCLoadingViewBGHeight);
        bgView.backgroundColor = [UIColor lightGrayColor];
        bgView.layer.masksToBounds = YES;
        bgView.layer.cornerRadius = 5.f;
        _bgView = bgView;
        
        [self addSubview:_bgView];
        
    }
    
    if (_activity == nil)
    {
        UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] init];
        activity.center = _bgView.center;
        activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [_bgView addSubview:activity];
        _activity = activity;
    }
    
    if (_contentLabel == nil)
    {
        _contentLabel = [[MULabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:14.0f];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor whiteColor];
        [_bgView addSubview:_contentLabel];
    }
    
    _contentLabel.text = labelText;
    
    self.frame = CGRectMake(kGetX(self), topSpace, kGetWidth(self), SCREENH - topSpace - bottomSpace);
    _bgView.frame = CGRectMake((kGetWidth(self) - kGetWidth(_bgView))/2, (kGetHeight(self) - kGetHeight(_bgView))/2, kGetWidth(_bgView), kGetHeight(_bgView));
    
    if (labelText == nil)
    {
        _bgView.frame = CGRectMake((self.width - 80)/2, (self.height - 80)/2, 80, 80);
        _activity.center = CGPointMake(_bgView.frame.size.width/2, _bgView.frame.size.height/2);
        _contentLabel.hidden = YES;
        
    }
    else
    {
        _activity.center = CGPointMake(_bgView.frame.size.width/2, _bgView.frame.size.height/2 - 15);
        _contentLabel.hidden = NO;
        _contentLabel.frame = CGRectMake(0, _activity.frame.origin.y + _activity.frame.size.height + 15, _bgView.frame.size.width, _bgView.frame.size.height - _activity.frame.origin.y - _activity.frame.size.height);
    }
    
    [_activity startAnimating];
    
    _bgView.hidden = NO;
    self.hidden = NO;
    [[MUKitTool getMainWindow] insertSubview:self atIndex:INT32_MAX];
}


-(void)showMCLoadingViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText andAnimateType:(MCLoadingAnimateType)type
{
    _bgView.hidden = YES;
    loadImageView.hidden = NO;
    switch (type)
    {
        case MCLoadingAnimateTypeNormal:
        {
            self.frame = CGRectMake(0, topSpace, SCREENW, (SCREENH - topSpace - bottomSpace));
          
            if (loadImageView == nil)
            {
                loadImageView = [[UIImageView alloc] init];
                loadImageView.frame = CGRectMake((self.width - 70)/2, (self.height - 70)/2, 70, 70);
                NSMutableArray  *arrayM=[NSMutableArray array];
                for (int i = 1; i<3; i++) {
                    [arrayM sui_addObj:[UIImage imageNamed:[NSString stringWithFormat:@"loding%d.png",i]]];
                }
                //设置动画数组
                [loadImageView setAnimationImages:arrayM];
                //设置动画播放次数
                [loadImageView setAnimationRepeatCount:0];
                //设置动画播放时间
                [loadImageView setAnimationDuration:0.5];
                
                [self addSubview:loadImageView];
            }
            
            
            if (_contentLabel == nil)
            {
                _contentLabelAnimate = [MULabel LabelWithType:MULabelTypeAutoFrame];
                _contentLabelAnimate.font = [UIFont systemFontOfSize:12.0f];
                _contentLabelAnimate.textAlignment = NSTextAlignmentCenter;
                _contentLabelAnimate.textColor = MUSColor(255, 255, 255, 1);
                [self addSubview:_contentLabelAnimate];
            }
            
            if (labelText == nil)
            {
                labelText = @"";
            }
            _contentLabelAnimate.text = labelText;
            _contentLabelAnimate.frame = CGRectMake((SCREENW - _contentLabel.width - 10)/2, loadImageView.frame.origin.y + loadImageView.frame.size.height , _contentLabel.width + 10, _contentLabel.height);
            
            
            //开始动画
            [loadImageView startAnimating];
            self.hidden = NO;

        }
            break;
            
        default:
            break;
    }
}

-(void)stopMCLoadingView
{
    //    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_activity stopAnimating];
    [loadImageView stopAnimating];
    self.hidden = YES;
}

@end




@interface MCParentLoadingView ()
/**
 *  背景灰色View
 */
@property (nonatomic, strong) UIView * bgView;

/**
 *  菊花
 */
@property (nonatomic, strong) UIActivityIndicatorView * activityView;
@end

@implementation MCParentLoadingView

-(instancetype)init
{
    if (self = [super init])
    {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor clearColor];
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 5;
        
        _activityView = [[UIActivityIndicatorView alloc] init];
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [_bgView addSubview:_activityView];
        
        
        _contentLabel = [[MULabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14.0f];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor whiteColor];
        [_bgView addSubview:_contentLabel];
        
        [self addSubview:_bgView];
      
        self.hidden = YES;
    }
    return self;
}

-(void)setMCLoadingViewText:(NSString *)labelText andParentView:(UIView *)parentView
{
    _contentLabel.text = labelText;
    _bgView.frame = CGRectMake((kGetWidth(self) - MCLoadingViewBGWidth)/2, (kGetHeight(self) - MCLoadingViewBGHeight)/2, MCLoadingViewBGWidth, MCLoadingViewBGHeight);
    _activityView.center = CGPointMake(kGetWidth(_bgView)/2, kGetHeight(_bgView)/2 - 15);
    _contentLabel.frame = CGRectMake(0, _activityView.frame.origin.y + _activityView.frame.size.height + 15, _bgView.frame.size.width, _bgView.frame.size.height - _activityView.frame.origin.y - _activityView.frame.size.height);
    [parentView addSubview:self];
}

-(void)setMCGrayLoadingViewText:(NSString *)labelText andParentView:(UIView *)parentView andRect:(CGRect)rect
{
    _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self setMCLoadingViewText:labelText andParentView:parentView andRect:rect];
}

-(void)setMCLoadingViewText:(NSString *)labelText andParentView:(UIView *)parentView andRect:(CGRect)rect
{
    if (labelText)
    {
        //暂不考虑
        _contentLabel.text = labelText;
        _bgView.frame = CGRectMake((kGetWidth(self) - MCLoadingViewBGWidth)/2, (kGetHeight(self) - MCLoadingViewBGHeight)/2, MCLoadingViewBGWidth, MCLoadingViewBGHeight);
        _activityView.center = CGPointMake(kGetWidth(_bgView)/2, kGetHeight(_bgView)/2 - 15);
        _contentLabel.frame = CGRectMake(0, _activityView.frame.origin.y + _activityView.frame.size.height + 15, _bgView.frame.size.width, _bgView.frame.size.height - _activityView.frame.origin.y - _activityView.frame.size.height);
        [parentView addSubview:self];
    }
    else
    {
        _bgView.frame = rect;
        _activityView.center = CGPointMake(kGetWidth(_bgView)/2, kGetHeight(_bgView)/2);
        [parentView addSubview:self];
    }
}

-(void)startMCLoadingView
{
    self.hidden = NO;
    [_activityView startAnimating];
}

-(void)stopMCLoadingView
{
    self.hidden = YES;
    [_activityView stopAnimating];
}

@end




#define kMCToastViewDuring          1.5f
#define kMCToastViewFont            16.0f
#define kMCToastViewLeftSpace       10.0f
#define kMCToastViewTopSpace        10.0f
#define kMCToastViewAlpha           0.8f
#define KMCToastViewBottomSpace     60.0f
static BOOL isHavaBlock;

@interface MCToastView ()

@property (nonatomic, strong) UIView * bgView;

/**
 *  文字上方的图片
 */
@property (nonatomic, strong) UIImageView * titleImage;

/**
 *  文字文本
 */
@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, assign) MCToastViewShowType type;

@end

@implementation MCToastView

+(instancetype)shareMCToastView
{
    static MCToastView * custom = nil;
    static dispatch_once_t onceToken2;
    dispatch_once(&onceToken2, ^{
        custom = [[MCToastView alloc] init];
        [custom createMainView];
    });
   
    return custom;
}

-(void)createMainView
{
    self.bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor grayColor];
    _bgView.alpha = kMCToastViewAlpha;
    _bgView.layer.masksToBounds = YES;
    _bgView.layer.cornerRadius = 5;
    [self addSubview:_bgView];
    
    
    
    self.titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:kMCToastViewFont];
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    [_bgView addSubview:_titleLabel];
    
    
    self.titleImage = [[UIImageView alloc] init];
    [_bgView addSubview:_titleImage];
}

-(void)showToast:(NSString *)toastString
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeBottom;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToast:(NSString *)toastString forType:(MCToastViewShowType)type
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = type;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}
-(void)showToast:(NSString *)toastString andDuring:(CGFloat)during
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeBottom;
    
    [self changeSubViewsFrameAndAnimation:toastString andDuring:during];
}

-(void)showToast:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    self.hidden = NO;
    _toastBlock = block;
    _type = MCToastViewShowTypeBottom;

    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastInCenter:(NSString *)toastString
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeCenter;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastInCenter:(NSString *)toastString andDuring:(CGFloat)during
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeCenter;

    [self changeSubViewsFrameAndAnimation:toastString andDuring:during];
}

-(void)showToastInCenter:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    self.hidden = NO;
    _toastBlock = block;
    _type = MCToastViewShowTypeCenter;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeImageCenter;
    _titleImage.image = showImage;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    self.hidden = NO;
    _toastBlock = block;
    _type = MCToastViewShowTypeImageCenter;
    _titleImage.image = showImage;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)changeSubViewsFrameAndAnimation:(NSString *)toastString
{
    if (toastString == nil)
    {
        toastString = @"";
    }
    
    CGSize size = [MUViewTool getLabelActualSize:toastString andFont:kMCToastViewFont andLines:0 andlabelWidth:(SCREENW - kMCToastViewLeftSpace*4)];
    _titleLabel.text = toastString;
    _titleLabel.hidden = NO;
    _titleImage.hidden = YES;
    switch (_type) {
        case MCToastViewShowTypeBottom:
        {
            _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, size.width, size.height);
            _bgView.frame = CGRectMake((SCREENW - _titleLabel.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - KMCToastViewBottomSpace - _titleLabel.frame.size.height - kMCToastViewTopSpace*2), _titleLabel.frame.size.width + kMCToastViewLeftSpace*2, _titleLabel.frame.size.height + kMCToastViewTopSpace*2);
            break;
        }
        case MCToastViewShowTypeCenter:
        {
            _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, size.width, size.height);
            _bgView.frame = CGRectMake((SCREENW - _titleLabel.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.frame.size.height - kMCToastViewTopSpace*2)/2, _titleLabel.frame.size.width + kMCToastViewLeftSpace*2, _titleLabel.frame.size.height + kMCToastViewTopSpace*2);
            break;
        }
        case MCToastViewShowTypeImageCenter:
        {
            _titleImage.hidden = NO;
            if (toastString == nil)
            {
                _titleLabel.hidden = YES;
                _titleImage.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                _bgView.frame = CGRectMake((SCREENW - _titleImage.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleImage.frame.size.height - kMCToastViewTopSpace*2)/2, _titleImage.frame.size.width + kMCToastViewLeftSpace*2, _titleImage.frame.size.height + kMCToastViewTopSpace*2);
            }
            else
            {
                if (size.width >= _titleImage.image.size.width)
                {
                    _titleImage.frame = CGRectMake((size.width + kMCToastViewLeftSpace*2 - _titleImage.image.size.width)/2, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                    _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, _titleImage.frame.origin.y + _titleImage.frame.size.height + kMCToastViewTopSpace, size.width, size.height);
                    _bgView.frame = CGRectMake((SCREENW - _titleLabel.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.frame.origin.y - _titleLabel.frame.size.height - kMCToastViewTopSpace)/2, _titleLabel.frame.size.width + kMCToastViewLeftSpace*2,_titleLabel.frame.origin.y + _titleLabel.frame.size.height + kMCToastViewTopSpace);
                }
                else
                {
                    _titleImage.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                    _titleLabel.frame = CGRectMake((_titleImage.bounds.size.width + kMCToastViewLeftSpace*2 - size.width)/2, _titleImage.frame.origin.y + _titleImage.frame.size.height + kMCToastViewTopSpace, size.width, size.height);
                    _bgView.frame = CGRectMake((SCREENW - _titleImage.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.frame.origin.y - _titleLabel.frame.size.height - kMCToastViewTopSpace)/2, _titleImage.frame.size.width + kMCToastViewLeftSpace*2, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + kMCToastViewTopSpace);
                }
            }
            break;
        }
        default: {
            break;
        }
    }
    
    dispatch_time_t toastDelay = dispatch_time(DISPATCH_TIME_NOW, kMCToastViewDuring * NSEC_PER_SEC);
    dispatch_queue_t currentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(toastDelay, currentQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopToastView];
        });
    });
}

-(void)changeSubViewsFrameAndAnimation:(NSString *)toastString andDuring:(CGFloat)during
{
    if (toastString == nil)
    {
        toastString = @"";
    }
    
    CGSize size = [MUViewTool getLabelActualSize:toastString andFont:kMCToastViewFont andLines:0 andlabelWidth:(SCREENW - kMCToastViewLeftSpace*4)];
    _titleLabel.text = toastString;
    _titleLabel.hidden = NO;
    _titleImage.hidden = YES;
    switch (_type) {
        case MCToastViewShowTypeBottom:
        {
            _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, size.width, size.height);
            _bgView.frame = CGRectMake((SCREENW - _titleLabel.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - KMCToastViewBottomSpace - _titleLabel.frame.size.height - kMCToastViewTopSpace*2), _titleLabel.frame.size.width + kMCToastViewLeftSpace*2, _titleLabel.frame.size.height + kMCToastViewTopSpace*2);
            break;
        }
        case MCToastViewShowTypeCenter:
        {
            _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, size.width, size.height);
            _bgView.frame = CGRectMake((SCREENW - _titleLabel.width - kMCToastViewLeftSpace*2)*0.5, (SCREENH - _titleLabel.frame.size.height - kMCToastViewTopSpace*2)*0.5, _titleLabel.frame.size.width + kMCToastViewLeftSpace*2, _titleLabel.height + kMCToastViewTopSpace*2);
            break;
        }
        case MCToastViewShowTypeImageCenter:
        {
            _titleImage.hidden = NO;
            if (toastString == nil)
            {
                _titleLabel.hidden = YES;
                _titleImage.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                _bgView.frame = CGRectMake((SCREENW - _titleImage.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleImage.frame.size.height - kMCToastViewTopSpace*2)/2, _titleImage.frame.size.width + kMCToastViewLeftSpace*2, _titleImage.frame.size.height + kMCToastViewTopSpace*2);
            }
            else
            {
                if (size.width >= _titleImage.image.size.width)
                {
                    _titleImage.frame = CGRectMake((size.width + kMCToastViewLeftSpace*2 - _titleImage.image.size.width)/2, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                    _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, _titleImage.frame.origin.y + _titleImage.frame.size.height + kMCToastViewTopSpace, size.width, size.height);
                    _bgView.frame = CGRectMake((SCREENW - _titleLabel.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.frame.origin.y - _titleLabel.frame.size.height - kMCToastViewTopSpace)/2, _titleLabel.frame.size.width + kMCToastViewLeftSpace*2,_titleLabel.frame.origin.y + _titleLabel.frame.size.height + kMCToastViewTopSpace);
                }
                else
                {
                    _titleImage.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                    _titleLabel.frame = CGRectMake((_titleImage.bounds.size.width + kMCToastViewLeftSpace*2 - size.width)/2, _titleImage.frame.origin.y + _titleImage.frame.size.height + kMCToastViewTopSpace, size.width, size.height);
                    _bgView.frame = CGRectMake((SCREENW - _titleImage.frame.size.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.frame.origin.y - _titleLabel.frame.size.height - kMCToastViewTopSpace)/2, _titleImage.frame.size.width + kMCToastViewLeftSpace*2, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + kMCToastViewTopSpace);
                }
            }
            break;
        }
        default: {
            break;
        }
    }
    
    dispatch_time_t toastDelay = dispatch_time(DISPATCH_TIME_NOW, during * NSEC_PER_SEC);
    dispatch_queue_t currentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(toastDelay, currentQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopToastView];
        });
    });
}

-(void)stopToastView
{
    if (isHavaBlock)
    {
        if (_toastBlock)
        {
            _toastBlock();
        }
    }
    self.hidden = YES;
}
- (void)showToastInCenterWithContent:(NSString *)toastString andDuring:(CGFloat)during{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeCenter;
    
    if (toastString == nil)
    {
        toastString = @"";
    }
    
    CGSize size = [MUViewTool getLabelActualSize:toastString andFont:kMCToastViewFont andLines:0 andlabelWidth:(SCREENW - kMCToastViewLeftSpace*6)];
    
    _bgView.layer.cornerRadius = 24.0f;
    _bgView.layer.masksToBounds = YES;
    
    _bgView.backgroundColor = [UIColor blackColor];
    _bgView.alpha = 0.7;
    
    
    _titleLabel.text = toastString;
    _titleLabel.hidden = NO;
    _titleImage.hidden = YES;
    
    _titleLabel.frame = CGRectMake(15, 15, size.width, size.height);
    _bgView.frame = CGRectMake((SCREENW - _titleLabel.width - 30)*0.5, (SCREENH - _titleLabel.height - 30)*0.5, _titleLabel.width + 30, _titleLabel.height + 30);
    
    dispatch_time_t toastDelay = dispatch_time(DISPATCH_TIME_NOW, during * NSEC_PER_SEC);
    dispatch_queue_t currentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(toastDelay, currentQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopToastView];
        });
    });
    
}

@end
