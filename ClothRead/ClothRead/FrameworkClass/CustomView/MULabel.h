//
//  MULabel.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    MULabelTypeTap = 0,                                             //带点击事件
    MULabelTypeAutoFrame,                                           //根据文字自适应宽高
    MULabelTypeTapAutoFrame,                                        //带点击事件.根据文字自适应宽高
    MULabelTypeAutoFrameAndLine,                                    //根据文字自适应宽高并且限制行数
    MULabelTypeTapAutoFrameAndLine                                  //带点击事件.根据文字自适应宽高并且限制行数
}MULabelType;


@interface MULabel : UILabel

/**
 *  限制的文本宽度(实现自定义类型的时候必须传入的值)
 */
@property (nonatomic, assign) CGFloat limitWidth;

/**
 *  限制的文本行数(Type为MULabelTypeAutoFrameAndLine使用)
 */
@property (nonatomic, assign) NSInteger limitNumbers;



/**
 *  获取不同类型MULabel实例
 *
 *  @param type 参照-MULabelType
 *
 */
+(MULabel *)LabelWithType:(MULabelType)type;


/**
 *  对MULabel添加事件
 *
 *  @param labelTarget 标记
 *  @param selector    事件
 */
-(void)addTarget:(id)labelTarget andSelector:(SEL)selector;

/**
 *  对MULabel添加事件并添加触发事件的点击Tap次数
 *
 *  @param labelTarget 标记
 *  @param selector    事件
 *  @param tapNumber 触发事件的点击次数
 */
-(void)addTarget:(id)labelTarget andSelector:(SEL)selector andTapNumber:(NSInteger)tapNumber;

@end

NS_ASSUME_NONNULL_END
