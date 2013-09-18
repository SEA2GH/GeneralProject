//
//  NSDate+GPCategory.h
//  GeneralProject
//
//  Created by guo haiyang on 18/09/13.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (GPCategory)

+ (void)functionTiming:(void(^)(void))block;

@end
