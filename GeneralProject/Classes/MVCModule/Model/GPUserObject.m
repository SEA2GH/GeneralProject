//
//  GPUserObject.m
//  GeneralProject
//
//  Created by guo haiyang on 24/09/13.
//
//

#import "GPUserObject.h"


@interface GPUserObject ()
{
    NSInteger _status;
}

@end


@implementation GPUserObject

@dynamic isDefault;
@dynamic account;
@dynamic password;

@dynamic status;


- (NSInteger)status
{
    return _status;
}

- (void)setStatus:(NSInteger)status
{
    [self willChangeValueForKey:@"status"];
    _status = status;
    [self didChangeValueForKey:@"status"];
}


@end
