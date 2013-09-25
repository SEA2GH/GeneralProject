//
//  GPTableViewController.m
//  GeneralProject
//
//  Created by guo haiyang on 25/09/13.
//
//

#import "GPTableViewController.h"

@interface GPTableViewController ()

@end

@implementation GPTableViewController

@synthesize cellTableView;
@synthesize sectionTableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    self.cellTableView.tag = GPTableView_Cell;
    self.sectionTableView.tag = GPTableView_Section;
    
    self.cellTableView.dataSource = self;
    self.cellTableView.delegate = self;
    self.sectionTableView.dataSource = self;
    self.sectionTableView.delegate = self;
    
    [self.sectionTableView setFrame:CGRectMake(0.0f, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
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

@end
