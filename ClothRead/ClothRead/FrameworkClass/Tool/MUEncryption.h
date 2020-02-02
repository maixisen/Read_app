//
//  MCEncryption.h
//  MeicaiStore
//
//  Created by 陈哲是个好孩子 on 15/5/14.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUEncryption : NSObject

/**
 *  Base64加密
 *
 *  @param string 要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)base64StringFromText:(NSString *)string;


/**
 *  Base64解密
 *
 *  @param base64 要解密的字符串
 *
 *  @return 返回解密后的字符串
 */
+(NSString *)base64FromBase64String:(NSString *)base64;



/**
 *  DES加密
 *
 *  @param data 要加密的数据Data
 *  @param key  自定义的key值
 *
 *  @return 返回加密后的加密data,返回的data不能转换成NSString
 */
+(NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;



/**
 *  DES解密
 *
 *  @param data 要解密的数据Data
 *  @param key  自定义key值
 *
 *  @return 返回解密后的data
 */
+(NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;



/**
 *  AES加密
 *
 *  @param data 要加密的数据Data
 *  @param key  自定义key值
 *
 *  @return 返回加密后data
 */
+(NSData *)AES256Encrypt:(NSData *)data WithKey:(NSString *)key;



/**
 *  AES解密
 *
 *  @param data 要解密的数据Data
 *  @param key  自定义key值
 *
 *  @return 返回解密后的data
 */
+(NSData *)AES256Decrypt:(NSData *)data WithKey:(NSString *)key;

/**
 *  AES加密(128)
 *
 *  @param str 要加密的字符串
 *  @param key 协商的key值
 *
 *  @return 加密后的字符串
 */
+(NSString *)AES128Encrypt:(NSString *)str WithKey:(NSString *)key;

/**
 *  AES解密(128)
 *
 *  @param str 解密字符串
 *  @param key 协商的key值
 *
 *  @return 解密后的字符串
 */
+(NSString *)AES128Decrypt:(NSString *)str WithKey:(NSString *)key;



/**
 *  MD5加密
 *
 *  @param inputString 加密字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)MD5EncryptionToString:(NSString *)inputString;


/**
 *  SHA单向散列算法
 *
 *  @param inputString 加密字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)SHAEncryptionToString:(NSString *)inputString;
/**
 *  获取文件md5值
 *
 *  @param path 路径
 *
 *  @return 文件的MD5
 */
+(NSString *)getFileMD5ByPath:(NSString *)path;

@end
