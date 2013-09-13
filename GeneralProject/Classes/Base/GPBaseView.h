//
//  GPBaseView.h
//  GeneralProject
//
//  Created by guo haiyang on 13/09/13.
//
//

#import <UIKit/UIKit.h>

@protocol GPBaseViewDelegate;

@interface GPBaseView : UIView

@property (nonatomic, weak) id<GPBaseViewDelegate> delegate;

@end

@protocol GPBaseViewDelegate <NSObject>

@optional
- (void)view:(GPBaseView *)view clickedElement:(UIView *)element;

@end
