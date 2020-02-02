//
//  MUPaddingLabel.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import "MULabel.h"

NS_ASSUME_NONNULL_BEGIN

/**
*  上下左右缩进的label
*/
@interface MUPaddingLabel : MULabel

@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@end

NS_ASSUME_NONNULL_END
