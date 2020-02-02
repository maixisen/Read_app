//
//  CRTextFieldView.h
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRTextFieldView : UIView

@property(nonatomic, strong)UITextField *textField;

@property(nonatomic, strong)UIImageView *leftImageView;

@property(nonatomic, copy)NSString *placeholderStr;

@property(nonatomic, assign)BOOL isLockView;

@end

NS_ASSUME_NONNULL_END
