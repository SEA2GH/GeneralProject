//
//  GPBaseOperation.h
//  GeneralProject
//
//  Created by guo haiyang on 22/09/13.
//
//

#import <Foundation/Foundation.h>

@protocol GPBaseOperationDelegate;

@interface GPBaseOperation : NSObject
{
    
}

@property (nonatomic, weak) id<GPBaseOperationDelegate> delegate;

@end

@protocol GPBaseOperationDelegate <NSObject>

@required

- (void)operation:(id)operation resultType:(NSInteger)resultType resultDescription:(NSString *)resultDescription;

@end
