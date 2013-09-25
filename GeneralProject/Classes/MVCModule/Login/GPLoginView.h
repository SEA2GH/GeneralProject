//
//  GPLoginView.h
//  GeneralProject
//
//  Created by guo haiyang on 24/09/13.
//
//

#import "GPBaseView.h"
#import "GPLoginTextField.h"

typedef enum
{
    GPLoginView_AccountTextField,
    GPLoginView_PasswordTextField,
}GPLoginViewElementType;

@interface GPLoginView : GPBaseView
{
    
}

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet GPLoginTextField *accountTextField;
@property (weak, nonatomic) IBOutlet GPLoginTextField *passwordTextField;

@end
