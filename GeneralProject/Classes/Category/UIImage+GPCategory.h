//
//  UIImage+GPCategory.h
//  GeneralProject
//
//  Created by guo haiyang on 22/09/13.
//
//

#import <UIKit/UIKit.h>

typedef enum
{
    UIImageLoad_Once,
    UIImageLoad_Repeat,
}UIImageLoadType;

@interface UIImage (GPCategory)

+ (UIImage *)loadImageNamed:(NSString *)name type:(UIImageLoadType)type;

@end
