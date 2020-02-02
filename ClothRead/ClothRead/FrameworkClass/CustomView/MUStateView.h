//
//  MCStateView.h
//  MeicaiStore
//
//  Created by mc962 on 15/10/20.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MUStateViewButtonType) {
    MUStateViewButtonTypeLogin = 100,   //暂未登录
    MUStateViewButtonTypeNoNetwork,     //当前无网
    MUStateViewButtonTypeNoData,        //网络请求失败
};

@protocol MUStateViewDelegate <NSObject>
@optional
-(void)dlStateButtonClicked:(MUStateViewButtonType)type;
@end

@interface MUStateView : UIView

@property (nonatomic, assign) CGFloat imageMaxY;

@property (nonatomic, assign) id<MUStateViewDelegate> delegate;

/**
 *  按钮类型
 */
@property (nonatomic, assign) MUStateViewButtonType type;

-(void)updateImage:(UIImage *)img andText:(NSString *)text andTwoText:(NSString *)twoText andButtonText:(NSString *)buttonText andButtonType:(MUStateViewButtonType)type;

-(void)hide;
-(void)showMCLoadingViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText;
-(void)hideLoadingView;
@end
