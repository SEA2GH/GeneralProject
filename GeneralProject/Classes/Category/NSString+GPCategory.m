//
//  NSString+GPCategory.m
//  GeneralProject
//
//  Created by guo haiyang on 13/09/13.
//
//

#import "NSString+GPCategory.h"


@implementation NSString (GPCategory)

@end


@implementation NSString (Judgement)


//判断字符串是否为空(长度，内容，空格)
- (BOOL)stringIsEmpty {
    
    if (self==nil || ([self length]<1))
    {
        return YES;
    }
    else
    {
        //A character set containing only the whitespace characters space (U+0020)
        //  and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        if ([trimedString length]==0)
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
}


@end

