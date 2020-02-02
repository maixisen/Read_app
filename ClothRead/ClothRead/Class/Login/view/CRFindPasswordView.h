//
//  CRFindPasswordView.h
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CRTextFieldView;

@protocol CRFindPasswordViewDelegate <NSObject>

- (void)getCode:(UIButton *_Nullable)btn;

- (void)timerStop:(UIButton *_Nullable)btn;

- (void)passwordClickWithLoginDict:(NSMutableDictionary *_Nullable)dict;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CRFindPasswordView : UIView

@property(nonatomic, strong)CRTextFieldView *phoneView;

@property(nonatomic, strong)CRTextFieldView *codeView;

@property(nonatomic, strong)CRTextFieldView *passwordView;

@property(nonatomic, strong)CRTextFieldView *commitPasswordView;

@property(nonatomic, strong)UIButton *passwordBtn;

@property(nonatomic, strong)UIButton *codeBtn;

@property(nonatomic, strong)id<CRFindPasswordViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
