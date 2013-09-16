//
//  UIScreen+GPCategory.h
//  GeneralProject
//
//  Created by guo haiyang on 16/09/13.
//
//

#import <UIKit/UIKit.h>

typedef enum
{
    W320H480,
    W320H568,
}GPScreenSizeType;

@interface UIScreen (GPCategory)

+ (GPScreenSizeType)sizeType;

@end
