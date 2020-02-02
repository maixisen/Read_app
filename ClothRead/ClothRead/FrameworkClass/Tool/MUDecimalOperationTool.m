//
//  MUDecimalOperationTool.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import "MUDecimalOperationTool.h"

@implementation MUDecimalOperationTool

+(NSString *)mutiplyString:(NSString *)string1 byString:(NSString *)string2{
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * mutiplyDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberByMultiplyingBy:mutiplyDecimalNumber];
    return result.stringValue;
}
+(NSString *)divideString:(NSString *)string1 byString:(NSString *)string2{
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * divideDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberByDividingBy:divideDecimalNumber];
    return result.stringValue;
}
+(NSString *)additionString:(NSString *)string1 byString:(NSString *)string2{
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * additionDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberByAdding:additionDecimalNumber];
    return result.stringValue;
}
+(NSString *)subtractionString:(NSString *)string1 byString:(NSString *)string2{
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * subtractionDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberBySubtracting:subtractionDecimalNumber];
    return result.stringValue;
}
+(NSString *)mutiplyString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode{
    NSDecimalNumberHandler * handler = [self getNumberHandlerByMode:mode scale:scale];
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * mutiplyDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberByMultiplyingBy:mutiplyDecimalNumber withBehavior:handler];
    //末尾不足位数补0
    if (scale!=0) {
        NSString * basePatten = @"0.";
        for (int i=0; i<scale; i++) {
            basePatten = [basePatten stringByAppendingString:@"0"];
        }
        basePatten = [basePatten stringByAppendingString:@";"];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = kCFNumberFormatterNoStyle;
        [formatter setPositiveFormat:basePatten];
        return [formatter stringFromNumber:result];
    }
    return result.stringValue;
}
+(NSString *)divideString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode{
    NSDecimalNumberHandler * handler = [self getNumberHandlerByMode:mode scale:scale];
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * divideDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberByDividingBy:divideDecimalNumber withBehavior:handler];
    //末尾不足位数补0
    if (scale!=0) {
        NSString * basePatten = @"0.";
        for (int i=0; i<scale; i++) {
            basePatten = [basePatten stringByAppendingString:@"0"];
        }
        basePatten = [basePatten stringByAppendingString:@";"];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = kCFNumberFormatterNoStyle;
        [formatter setPositiveFormat:basePatten];
        return [formatter stringFromNumber:result];
    }
    return result.stringValue;
}
+(NSString *)additionString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode{
    NSDecimalNumberHandler * handler = [self getNumberHandlerByMode:mode scale:scale];
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * additionDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberByAdding:additionDecimalNumber withBehavior:handler];
    //末尾不足位数补0
    if (scale!=0) {
        NSString * basePatten = @"0.";
        for (int i=0; i<scale; i++) {
            basePatten = [basePatten stringByAppendingString:@"0"];
        }
        basePatten = [basePatten stringByAppendingString:@";"];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = kCFNumberFormatterNoStyle;
        [formatter setPositiveFormat:basePatten];
        return [formatter stringFromNumber:result];
    }
    return result.stringValue;
}

+(NSString *)skuAdditionString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode{
    NSDecimalNumberHandler * handler = [self getNumberHandlerByMode:mode scale:scale];
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * additionDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberByAdding:additionDecimalNumber withBehavior:handler];
    //末尾不足位数补0
    if (scale!=0) {
        NSString * basePatten = @"0.";
        for (int i=0; i<scale; i++) {
            basePatten = [basePatten stringByAppendingString:@"0"];
        }
        basePatten = [basePatten stringByAppendingString:@";"];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = kCFNumberFormatterNoStyle;
        [formatter setPositiveFormat:basePatten];
        return [formatter stringFromNumber:result];
    }
    return result.stringValue;
}

+(NSString *)subtractionString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode{
    NSDecimalNumberHandler * handler = [self getNumberHandlerByMode:mode scale:scale];
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:string1];
    NSDecimalNumber * subtractionDecimalNumber = [NSDecimalNumber decimalNumberWithString:string2];
    NSDecimalNumber * result = [decimalNumber decimalNumberBySubtracting:subtractionDecimalNumber withBehavior:handler];
    //末尾不足位数补0
    if (scale!=0) {
        NSString * basePatten = @"0.";
        for (int i=0; i<scale; i++) {
            basePatten = [basePatten stringByAppendingString:@"0"];
        }
        basePatten = [basePatten stringByAppendingString:@";"];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = kCFNumberFormatterNoStyle;
        [formatter setPositiveFormat:basePatten];
        return [formatter stringFromNumber:result];
    }
    return result.stringValue;
}

+(NSDecimalNumberHandler *)getNumberHandlerByMode:(MUDecimalMode)mode scale:(int)scale{
    NSDecimalNumberHandler *roundUp;
    if (mode == MUDecimalModeBankers) {
        roundUp = [NSDecimalNumberHandler
                   decimalNumberHandlerWithRoundingMode:NSRoundBankers
                   scale:scale
                   raiseOnExactness:NO
                   raiseOnOverflow:NO
                   raiseOnUnderflow:NO
                   raiseOnDivideByZero:YES];
    }else{
        roundUp = [NSDecimalNumberHandler
                   decimalNumberHandlerWithRoundingMode:NSRoundDown
                   scale:scale
                   raiseOnExactness:NO
                   raiseOnOverflow:NO
                   raiseOnUnderflow:NO
                   raiseOnDivideByZero:YES];
    }
    return roundUp;
}
@end
