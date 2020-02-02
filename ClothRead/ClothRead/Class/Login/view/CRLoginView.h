//
//  CRLoginView.h
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CRTextFieldView;

@protocol CRLoginViewDelegate <NSObject>

- (void)loginClickWithLoginDict:(NSMutableDictionary *_Nullable)dict;

@end


NS_ASSUME_NONNULL_BEGIN

@interface CRLoginView : UIView<UITextFieldDelegate>

@property(nonatomic, strong)CRTextFieldView *phoneView;

@property(nonatomic, strong)CRTextFieldView *passwordView;

@property(nonatomic, strong)UIButton *loginBtn;

@property(nonatomic, assign)BOOL isClearPhone;

@property(nonatomic, assign)id<CRLoginViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
