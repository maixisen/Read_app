//
//  MUCheckoutTool.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/30.
//  Copyright © 2019 lee. All rights reserved.
//

#import "MUCheckoutTool.h"

@implementation MUCheckoutTool

+ (BOOL) validateMobile:(NSString *)mobileNum {
    /**
     * 手机号码
     * 移动：134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
     * 联通：130/131/132/155/156/185/186/145/176
     * 电信：133/153/180/181/189/177
     */
    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8]/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
     */
    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[0127-9]|8[23478]|47|78)\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130/131/132/152/155/156/185/186/145/176
     */
    NSString *CU = @"^1(3[0-2]|5[256]|8[56]|45|76)\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133/153/180/181/189/177
     */
    NSString *CT = @"^1((33|53|77|8[019])[0-9]|349)\\d{7}$";
     
    NSPredicate *regextestmobile =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
     
    if (([regextestmobile evaluateWithObject:mobileNum] == YES) ||
        ([regextestcm evaluateWithObject:mobileNum] == YES) ||
        ([regextestct evaluateWithObject:mobileNum] == YES) ||
        ([regextestcu evaluateWithObject:mobileNum] == YES)) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL) validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL) validateIdentityCard: (NSString *)identityCard {
    BOOL flag;

    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }

    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];

    return [identityCardPredicate evaluateWithObject:identityCard];
}

@end
