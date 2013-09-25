//
//  GPUserObject.h
//  GeneralProject
//
//  Created by guo haiyang on 24/09/13.
//
//

#import <CoreData/CoreData.h>

@interface GPUserObject : NSManagedObject
{
    
}

@property (nonatomic, assign) BOOL isDefault;
@property (nonatomic, strong) NSString * account;
@property (nonatomic, strong) NSString * password;

/*did not need save*/
@property (nonatomic, assign) NSInteger status;

@end
