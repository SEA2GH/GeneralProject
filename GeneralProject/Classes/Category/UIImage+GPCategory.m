//
//  UIImage+GPCategory.m
//  GeneralProject
//
//  Created by guo haiyang on 22/09/13.
//
//

#import "UIImage+GPCategory.h"


@implementation UIImage (GPCategory)


+ (UIImage *)loadImageNamed:(NSString *)name type:(UIImageLoadType)type
{
    switch (type)
    {
        case UIImageLoad_Once:
        {
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Resource" ofType:@"bundle"];
            NSString *path = [[bundlePath stringByAppendingPathComponent:@"Images"] stringByAppendingPathComponent:name];
            
            return [UIImage imageWithContentsOfFile:path];
        }break;
            
        case UIImageLoad_Repeat:
        {
            return [UIImage imageNamed:name];
        }break;
            
        default:
            break;
    }
    
    return [UIImage imageNamed:name];
}

@end
