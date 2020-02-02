//
//  LoadingView.h
//  MeicaiStore
//
//  Created by 是个好孩子 on 15/5/7.
//

#import <UIKit/UIKit.h>
#import "MULabel.h"

@interface LoadingView : UIView

/**
 *  切换到新的window层上
 */
-(void)exchangeNewMainWindow;

@end


typedef NS_ENUM(NSUInteger, MCLoadingAnimateType) {
    MCLoadingAnimateTypeNormal,
};

#pragma mark MCLoadingView
/*******************************   MCLoadingView  *****************************************/
@interface MCLoadingView : LoadingView
@property (nonatomic, strong) MULabel * contentLabel;
@property (nonatomic, strong) MULabel * contentLabelAnimate;
/**
 *  获取MCLoadingView实例
 */
+(instancetype)shareMCLoadingView;

/**
 *  显示MCLoadingView
 *
 *  @param topSpace  不可点击区域距离顶部的距离
 *  @param labelText 显示的文本信息
 */
-(void)showMCLoadingView:(CGFloat)topSpace andText:(NSString *)labelText;

/**
 *  显示MCLoadingView
 *
 *  @param topSpace  不可点击区域距离顶部的距离
 *  @param labelText 显示的文本信息
 */
-(void)showMCLoadingViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText;


/**
 *  @author 弑剑醉红尘, 15-10-19 17:10:16
 *
 *  展示Toast,传入字符串,不带带回调(位于屏幕中心)
 *
 *  @param topSpace    距离屏幕上方的间隙
 *  @param labelText   显示的字符串
 *  @param bottomSpace 距离屏幕下方的间隙
 */
- (void)showMCLoadingViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText andAnimateType:(MCLoadingAnimateType)type;

/**
 *  展示灰色的toast
 *
 *  @param topSpace    距离顶部距离
 *  @param bottomSpace 距离底部距离
 *  @param labelText   字样
 */
-(void)showMCLoadingViewforGrayTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText;
/**
 *  关闭MCLoadingView
 */
-(void)stopMCLoadingView;
@end

#pragma mark MCParentLoadingView
/*******************************   MCLoadingView   *****************************************/
@interface MCParentLoadingView : UIView
@property (nonatomic, strong) MULabel * contentLabel;

/**
 *  设置loading文本
 *
 *  @param labelText 文本信息
 */
-(void)setMCLoadingViewText:(NSString *)labelText andParentView:(UIView *)parentView;


/**
 *  设置loading文本
 *
 *  @param labelText 文本信息
 */
-(void)setMCLoadingViewText:(NSString *)labelText andParentView:(UIView *)parentView andRect:(CGRect)rect;

/**
 *  设置loading文本
 *
 *  @param labelText 文本信息
 */
-(void)setMCGrayLoadingViewText:(NSString *)labelText andParentView:(UIView *)parentView andRect:(CGRect)rect;

/**
 *  开始MCLoadingView
 */
-(void)startMCLoadingView;

/**
 *  关闭MCLoadingView
 */
-(void)stopMCLoadingView;
@end

@interface MCPayLoadingView : LoadingView

+ (instancetype)sharedCustomerLoaing;
/** 展示 */
-(void)showMCLoadingViewAndText:(NSString *)labelText;
/** 关闭 */
- (void)stopLoadView;
@end


#pragma mark MCToastView

typedef void(^toastFinishedBlock) (void);
/*******************************   MCToastView   *****************************************/
typedef NS_ENUM(NSUInteger, MCToastViewShowType) {
    MCToastViewShowTypeBottom,
    MCToastViewShowTypeCenter,
    MCToastViewShowTypeImageCenter,
};

@interface MCToastView : LoadingView
@property (nonatomic, copy) toastFinishedBlock toastBlock;
/**
 *  获取Toast实例
 *
 */
+(instancetype)shareMCToastView;


/**
 *  展示Toast,传入字符串,不带回调
 *
 *  @param toastString 显示的字符串
 */
-(void)showToast:(NSString *)toastString;

/**
 *  展示Toast,传入字符串,不带回调
 *
 *  @param toastString 显示的字符串
 */
-(void)showToast:(NSString *)toastString andDuring:(CGFloat)during;


/**
 *  展示Toast,传入字符串,带回调(位于底部)
 *
 *  @param toastString 显示的字符串
 *  @param block       动画结束回调
 */
-(void)showToast:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block;


/**
 *  展示Toast,传入字符串,不带回调(位于屏幕中心)
 *
 *  @param toastString 显示的字符串
 *
 */
-(void)showToastInCenter:(NSString *)toastString;

/**
 *  展示Toast,传入字符串,不带回调(位于屏幕中心)
 *
 *  @param toastString 显示的字符串
 *  @param during      动画时长
 */
-(void)showToastInCenter:(NSString *)toastString andDuring:(CGFloat)during;


/**
 *  展示Toast,传入字符串,带回调(位于屏幕中心)
 *
 *  @param toastString 显示的字符串
 *  @param block       动画结束回调
 */
-(void)showToastInCenter:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block;

/**
 *  展示Toast(只处于屏幕中心)
 *
 *  @param showImage   显示的图片
 *  @param toastString 显示的字符串
 */
-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString;

/**
 *  展示Toast(只处于屏幕中心)
 *
 *  @param showImage   显示的图片
 *  @param toastString 显示的字符串
 *  @param block       动画结束回调
 */
-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block;

/**
 *  展示在指定位置的toast
 *
 *  @param toastString 显示的字符串
 *  @param type        toast位置
 */
-(void)showToast:(NSString *)toastString forType:(MCToastViewShowType)type;

/**
 *  展示Toast,传入字符串,不带回调(位于屏幕中心 --- UI统一)
 *
 *  @param toastString 显示的字符串
 *  @param during      动画时长
 */
- (void)showToastInCenterWithContent:(NSString *)toastString andDuring:(CGFloat)during;

@end
