//
//  UIFont+GPCategory.m
//  GeneralProject
//
//  Created by guo haiyang on 18/09/13.
//
//

#import "UIFont+GPCategory.h"


@implementation UIFont (GPCategory)


+ (BOOL)fontIsDownloaded:(NSString *)fontName
{
    UIFont * aFont = [UIFont fontWithName:fontName size:12.0];
    if (aFont && ([aFont.fontName compare:fontName] == NSOrderedSame || [aFont.familyName compare:fontName] == NSOrderedSame)) {
        return YES;
    }
    
    return NO;
}


@end
