//
//  GPLoginView.m
//  GeneralProject
//
//  Created by guo haiyang on 24/09/13.
//
//

#import "GPLoginView.h"
#import "GPLoginTextField.h"


@implementation GPLoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.accountTextField.tag = GPLoginView_AccountTextField;
    self.passwordTextField.tag = GPLoginView_PasswordTextField;
    
    self.accountTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    self.accountTextField.returnKeyType = UIReturnKeyNext;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    
    self.accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.accountTextField.enablesReturnKeyAutomatically = YES;
    self.passwordTextField.enablesReturnKeyAutomatically = YES;
    
    self.passwordTextField.clearsOnBeginEditing = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag==GPLoginView_AccountTextField)
    {
        [self.passwordTextField becomeFirstResponder];
    }
    else
    {
        NSLog(@"登录操作！");
        
        [textField resignFirstResponder];
        [self.delegate view:self clickedElement:textField];
    }
    
    return YES;
}

@end
