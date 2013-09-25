//
//  GPTableViewController.h
//  GeneralProject
//
//  Created by guo haiyang on 25/09/13.
//
//

#import "GPBaseViewController.h"

typedef enum
{
    GPTableView_Cell,
    GPTableView_Section
}GPTableViewTag;

@interface GPTableViewController : GPBaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    
}

@property (weak, nonatomic) IBOutlet UITableView *cellTableView;
@property (weak, nonatomic) IBOutlet UITableView *sectionTableView;

@end
