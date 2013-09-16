//
//  UIScreen+GPCategory.m
//  GeneralProject
//
//  Created by guo haiyang on 16/09/13.
//
//

#import "UIScreen+GPCategory.h"


@implementation UIScreen (GPCategory)


+ (GPScreenSizeType)sizeType
{
    static GPScreenSizeType type;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        if ([NSStringFromCGSize([[UIScreen mainScreen] bounds].size) isEqualToString:@"{320, 568}"])
        {
            type = W320H568;
        }
        else if ([NSStringFromCGSize([[UIScreen mainScreen] bounds].size) isEqualToString:@"{320, 480}"])
        {
            type = W320H480;
        }
    });
    
    return type;
}


@end
