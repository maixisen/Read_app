//
//  BaseHttpService.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/4.
//  Copyright © 2019 lee. All rights reserved.
//

#import "BaseHttpService.h"

@implementation BaseHttpService

- (void)manageServiceSuccess:(BaseHttpResponse *)responseObject anaAlertType:(BaseHttpAlertType)type{
    [[BaseHttpManager shareManager].dataDictory removeObjectForKey:[NSString stringWithFormat:@"%lu",(long)responseObject.tag]];
    responseObject.alertType = type;
    
    NSInteger codeStr = [[responseObject.object objectForKey:@"code"] intValue];
    
    if (codeStr == 1) {
        if (self.serviceDelegate && [self.serviceDelegate respondsToSelector:@selector(requestSuccess:)]) {
            [self.serviceDelegate performSelector:@selector(requestSuccess:) withObject:responseObject];
        }
    }
    else{
        responseObject.isRequestSuccessFail = YES;
        if (self.serviceDelegate && [self.serviceDelegate respondsToSelector:@selector(requestFail:)]) {
            [self.serviceDelegate performSelector:@selector(requestFail:) withObject:responseObject];
        }
    }
    
}

- (void)manageServiceFail:(BaseHttpResponse *)responseObject anaAlertType:(BaseHttpAlertType)type{
   [[BaseHttpManager shareManager].dataDictory removeObjectForKey:[NSString stringWithFormat:@"%lu",(long)responseObject.tag]];
    
    responseObject.alertType = type;
    responseObject.isRequestSuccessFail = NO;
    if (self.serviceDelegate && [self.serviceDelegate respondsToSelector:@selector(requestFail:)]) {
        [self.serviceDelegate performSelector:@selector(requestFail:) withObject:responseObject];
    }
}

- (void)handlerFailInfo:(BaseHttpResponse *)responseObject{
    if (responseObject.isRequestSuccessFail) {
        [self handleHttpSuccessErrorInfo:responseObject];
    }
    else{
        [self handleHttpFailInfo:responseObject];
    }
}

// 处理后端返回error的提示信息
- (void)handleHttpSuccessErrorInfo:(BaseHttpResponse *)response{
    [self showError:[NSString stringWithFormat:@"%@",[[response.object objectForKey:@"error"] objectForKey:@"msg"]] andErrorCode:[NSString stringWithFormat:@"%@",[[response.object objectForKey:@""]objectForKey:@"code"]] andErrorType:response.alertType];
}
// 处理网络情况导致网络失败的提示信息
- (void)handleHttpFailInfo:(BaseHttpResponse *)response{
    [self showError:@"网络不给力，请稍后重试" andErrorCode:@"" andErrorType:response.alertType];
}

// 处理各种错误需要展示的alter
- (void)showError:(NSString *)errorStr andErrorCode:(NSString *)errorCode andErrorType:(BaseHttpAlertType)type{
    switch (type) {
        case BaseHttpAlertTypeNone:
            break;
        case BaseHttpAlertTypeToast:
            [[iToast makeText:errorStr] show];
            break;
        case BaseHttpAlertTypeNative:
        {
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"温馨提示：" message:errorStr preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confitAction = [UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"完成");
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"取消");
            }];
            [alertView addAction:cancelAction];
            [alertView addAction:confitAction];
            
            UIViewController *vc = nil;
            if ([[UIApplication sharedApplication].windows[0].rootViewController isKindOfClass:[UINavigationController class]]) {
                vc = (UIViewController *)((UINavigationController *)([UIApplication sharedApplication].windows[0].rootViewController)).visibleViewController;
            }
            else{
                vc = (UIViewController *)([UIApplication sharedApplication].windows[0].rootViewController);
            }
            [vc presentViewController:alertView animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

@end
