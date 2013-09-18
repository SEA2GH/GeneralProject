//
//  NSDate+GPCategory.m
//  GeneralProject
//
//  Created by guo haiyang on 18/09/13.
//
//

#import "NSDate+GPCategory.h"

@implementation NSDate (GPCategory)

+ (void)functionTiming:(void(^)(void))block {
    
    NSDate *anotherDate = [NSDate date];
    block();
    double timeInterval = [[NSDate date] timeIntervalSinceDate:anotherDate];
    NSLog(@">>>>>>>>>>function timing = %f", timeInterval);
}

@end
