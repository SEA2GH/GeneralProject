//
//  GPBaseView.h
//  GeneralProject
//
//  Created by guo haiyang on 13/09/13.
//
//

#import <UIKit/UIKit.h>

@protocol GPBaseViewDelegate;

@interface GPBaseView : UIView <UITextFieldDelegate>

@property (nonatomic, weak) id<GPBaseViewDelegate> delegate;

@end

@protocol GPBaseViewDelegate <NSObject>

@required
- (void)view:(GPBaseView *)view clickedElement:(UIView *)element;

@end
