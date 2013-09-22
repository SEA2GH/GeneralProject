//
//  UIColor+GPCategory.h
//  GeneralProject
//
//  Created by guo haiyang on 22/09/13.
//
//

#import <UIKit/UIKit.h>

#define DEFAULT_VOID_COLOR [UIColor blackColor];

@interface UIColor (GPCategory)

+ (UIColor *)colorFromHexString:(NSString *)hexString;
- (NSString *)hexStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

@end
