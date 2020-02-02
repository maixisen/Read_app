//
//  CRRegisterView.h
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CRTextFieldView;

@protocol CRRegisterViewDelegate <NSObject>

- (void)registerClickWithLoginDict:(NSMutableDictionary *_Nullable)dict;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CRRegisterView : UIView

@property(nonatomic, strong)CRTextFieldView *phoneView;

@property(nonatomic, strong)CRTextFieldView *passwordView;

@property(nonatomic, strong)CRTextFieldView *commitPasswordView;

@property(nonatomic, strong)UIButton *registerBtn;

@property(nonatomic, assign)id<CRRegisterViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
