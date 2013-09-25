//
//  GPBaseViewController.m
//  GeneralProject
//
//  Created by guo haiyang on 13/09/13.
//
//

#import "GPBaseViewController.h"

@interface GPBaseViewController ()

@end

@implementation GPBaseViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)view:(GPBaseView *)view clickedElement:(UIView *)element
{
    
}

@end
