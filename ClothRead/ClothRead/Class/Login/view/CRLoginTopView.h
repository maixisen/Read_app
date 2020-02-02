//
//  CRLoginTopView.h
//  ClothRead
//
//  Created by Kathleen on 2020/1/29.
//  Copyright © 2020 strong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CRChooseBtnView;

@protocol CRLoginTopViewDelegate <NSObject>

- (void)chooseLoginStatusWithBtn:(UIButton *_Nullable)btn;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CRLoginTopView : UIView

// 登录
@property(nonatomic, strong)CRChooseBtnView *loginView;
// 注册
@property(nonatomic, strong)CRChooseBtnView *registerView;
// 找回密码
@property(nonatomic, strong)CRChooseBtnView *findPasswordView;
// delegate
@property(nonatomic, assign)id <CRLoginTopViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
