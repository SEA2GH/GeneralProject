//
//  GPEncryption.h
//  GeneralProject
//
//  Created by guo haiyang on 13/09/13.
//
//

#import <Foundation/Foundation.h>
//#import "NSData+GPCategory.h"

@interface GPEncryption : NSObject

/*!
 if key is nil, you can set kDesEncryptionKey in .m file or use bundleIdentifier
 */
+ (NSString *)desEncryptString:(NSString *)string withKey:(NSString *)key;
+ (NSString *)desEncryptString:(NSString *)string;//kDesEncryptionKey

+ (NSString *)desDecryptString:(NSString *)string withKey:(NSString *)key;
+ (NSString *)desDecryptString:(NSString *)string;//kDesEncryptionKey

@end
