//
//  GPEncryption.m
//  GeneralProject
//
//  Created by guo haiyang on 13/09/13.
//
//

#import "GPEncryption.h"
#import "NSData+GPCategory.h"
#import <CommonCrypto/CommonCryptor.h>

//if you do not want to use kDesEncryptionKey, you may set to be @""
#define kDesEncryptionKey @"com.company.project"


@interface GPEncryption ()

+ (NSData *)desData:(NSData *)dataIn key:(NSString *)key CCOperation:(CCOperation)op;
+ (NSData *)dataFromHexString:(NSString *)string;
+ (NSString *)hexStringFromData:(NSData *)data;


@end


@implementation GPEncryption


+ (NSString *)desEncryptString:(NSString *)string withKey:(NSString *)key {
    
    NSData *dataIn = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData *dataOut = [GPEncryption desData:dataIn key:([key length]>0?key:kDesEncryptionKey) CCOperation:kCCEncrypt];
    
    //change the result not to be common other encryption method
    NSString *result = [[GPEncryption hexStringFromData:dataOut] description];
    
    return result;
}


+ (NSString *)desEncryptString:(NSString *)string {
    
    return [GPEncryption desEncryptString:string withKey:nil];
}


+ (NSString *)desDecryptString:(NSString *)string withKey:(NSString *)key {
    
    NSData *dataIn = [GPEncryption dataFromHexString:string];
    NSData *dataOut = [GPEncryption desData:dataIn key:([key length]>0?key:kDesEncryptionKey) CCOperation:kCCDecrypt];
    
    NSString *result = [[NSString alloc] initWithData:dataOut encoding:NSUTF8StringEncoding];
    
    return result;
}


+ (NSString *)desDecryptString:(NSString *)string {
    
    return [GPEncryption desDecryptString:string withKey:nil];
}


#pragma mark Method

+ (NSData *)desData:(NSData *)dataIn key:(NSString *)key CCOperation:(CCOperation)op {
    
    NSData *result = nil;
    
    if (key==nil || [key length]==0)
    {
        key = [[NSBundle mainBundle] bundleIdentifier];
    }
    
    unsigned char dataOut[1024];memset(dataOut, 0, sizeof(char));size_t dataOutMoved = 0;
    
    /*CCCryptorStatus CCCrypt(
     CCOperation op,         // kCCEncrypt, etc.
     CCAlgorithm alg,        // kCCAlgorithmAES128, etc.
     CCOptions options,      // kCCOptionPKCS7Padding, etc.
     const void *key,
     size_t keyLength,
     const void *iv,         // optional initialization vector
     const void *dataIn,     // optional per op and alg
     size_t dataInLength,
     void *dataOut,          // data RETURNED here
     size_t dataOutAvailable,
     size_t *dataOutMoved)*/
    CCCryptorStatus cryptorStatus = CCCrypt(
                                            op,
                                            kCCAlgorithmDES,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode,
                                            [key UTF8String],
                                            kCCKeySizeDES,
                                            NULL,
                                            [dataIn bytes],
                                            [dataIn length],
                                            dataOut,
                                            1024,
                                            &dataOutMoved);
    
    
    if(cryptorStatus == kCCSuccess)
    {
        result = [NSData dataWithBytes:dataOut length:(NSUInteger)dataOutMoved];
    }
    
    return result;
}


+ (NSString *)hexStringFromData:(NSData *)data {
    
    if (data==nil || [data length]==0)
    {
        return nil;
    }
    
    NSMutableString *result = [[NSMutableString alloc] init];
    
    unsigned char *bytes = (unsigned char *)[data bytes];
    for (int n = 0; n < data.length; n++)
    {
        NSString *tmp = [NSString stringWithFormat:@"%02x", (bytes[n] & 0XFF)];
        [result appendString:tmp];
    }
    
    return result;
}


+ (NSData *)dataFromHexString:(NSString *)string {
    
    NSString *hexString = [[string uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([hexString length]%2!=0)
    {
        return nil;
    }
    
    NSMutableData *result = [NSMutableData data];
    
    Byte tmp[1] = {0};
    for (int i=0; i<[hexString length]; i++)
    {
        unichar hex_char1 = [hexString characterAtIndex:i];//两位16进制数中的第一位(高位*16)
        
        int int_ch1;
        if (hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48) * 16;// 0 的Ascll - 48
        else if (hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55) * 16;// A 的Ascll - 65
        else
            return nil;
        
        i++;
        
        unichar hex_char2 = [hexString characterAtIndex:i];//两位16进制数中的第二位(低位)
        
        int int_ch2;
        if (hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48);// 0 的Ascll - 48
        else if (hex_char2 >= 'A' && hex_char2 <='F')
            int_ch2 = (hex_char2-55);// A 的Ascll - 65
        else
            return nil;
        
        tmp[0] = int_ch1+int_ch2;//将转化后的数放入Byte数组里
        [result appendBytes:tmp length:1];
    }
    
    return result;
}


@end
