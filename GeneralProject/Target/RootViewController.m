//
//  RootViewController.m
//  GeneralProject
//
//  Created by guo haiyang on 24/09/13.
//
//

#import "RootViewController.h"
#import "GPEncryption.h"
#import "AppDelegate.h"

#import "GPLoginViewController.h"


@interface RootViewController ()

@end


@implementation RootViewController


- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (UINavigationController *)navigationController
{
    return [[self appDelegate] navigationController];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)encryptionTest
{
    //right
    NSString *string = [GPEncryption desEncryptString:@"www.baidu.com"];
    NSLog(@"%@ is the result of des string:%@",string, [GPEncryption desDecryptString:string]);
    
    //wrong
    NSLog(@"%@ is the result of des string:%@ use wrong key",string, [GPEncryption desDecryptString:string withKey:@"123"]);
}

- (id)init
{
    if (self = [super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(navigationToLoginVC) name:loginDidNotAuthenticate object:nil];
    }
    
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    GPLoginViewController *loginVC = [[GPLoginViewController alloc] initWithNibName:@"GPLoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self encryptionTest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationToLoginVC
{
    
}

@end
