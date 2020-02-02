//
//  MULabel.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import "MULabel.h"

@interface MULabel()
@property (nonatomic, assign) CGSize labelSize;
@property (nonatomic, assign) MULabelType labelType;
@end

@implementation MULabel

-(instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor clearColor];
        self.limitWidth = SCREENW;
    }
    return self;
}


+(MULabel *)LabelWithType:(MULabelType)type
{
    MULabel * label = [[MULabel alloc] init];
    label.labelType = type;
    return label;
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    switch (_labelType)
    {
        case MULabelTypeTapAutoFrame:
        {
            _labelSize = [MUViewTool getLabelActualSize:text andFont:self.font.pointSize andLines:0 andlabelWidth:_limitWidth];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _labelSize.width, _labelSize.height);
        }
            break;
        case MULabelTypeAutoFrame:
        {
            _labelSize = [MUViewTool getLabelActualSize:text andFont:self.font.pointSize andLines:0 andlabelWidth:_limitWidth];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _labelSize.width, _labelSize.height);
        }
            break;
        case MULabelTypeAutoFrameAndLine:
        {
            _labelSize = [MUViewTool getLabelActualSize:text andFont:self.font.pointSize andLines:_limitNumbers andlabelWidth:_limitWidth];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _labelSize.width, _labelSize.height);
        }
            break;
        case MULabelTypeTapAutoFrameAndLine:
        {
            _labelSize = [MUViewTool getLabelActualSize:text andFont:self.font.pointSize andLines:0 andlabelWidth:_limitWidth];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _labelSize.width, _labelSize.height);
        }
            break;
            
        default:
            break;
    }
    
}


-(void)addTarget:(id)labelTarget andSelector:(SEL)selector
{
    if (_labelType == MULabelTypeTap || _labelType == MULabelTypeTapAutoFrameAndLine || _labelType == MULabelTypeTapAutoFrame)
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:labelTarget action:selector];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tap];
    }
}


-(void)addTarget:(id)labelTarget andSelector:(SEL)selector andTapNumber:(NSInteger)tapNumber
{
    if (_labelType == MULabelTypeTap || _labelType == MULabelTypeTapAutoFrameAndLine || _labelType == MULabelTypeTapAutoFrame)
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:labelTarget action:selector];
        self.userInteractionEnabled = YES;
        tap.numberOfTapsRequired = tapNumber;
        [self addGestureRecognizer:tap];
    }
}

@end
