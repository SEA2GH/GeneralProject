//
//  GPLoginViewController.m
//  GeneralProject
//
//  Created by guo haiyang on 24/09/13.
//
//

#import "GPLoginViewController.h"
#import "GPUserObject.h"
#import "GPLoginView.h"


@interface GPLoginViewController ()
{
    GPLoginView *loginView;
    GPUserObject *userObject;
}

@end

@implementation GPLoginViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    loginView = (GPLoginView *)self.view;
    loginView.delegate = self;
    
    [userObject addObserver:self forKeyPath:@"status" options:0 context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"])
    {
        ;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)view:(GPBaseView *)view clickedElement:(UIView *)element
{
    NSString *accountText = [loginView.accountTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *passwordText = [loginView.passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([accountText length]<1)
    {
        NSLog(@"账号不能为空");
    }
    else if ([passwordText length]<1)
    {
        NSLog(@"密码不能为空");
    }
    else
    {
        NSLog(@"account:%@, password:%@", accountText, passwordText);
    }
}

- (void)dealloc
{
    [userObject removeObserver:self forKeyPath:@"status"];
}

@end
