//
//  GPBaseViewController+GPCategory.m
//  GeneralProject
//
//  Created by guo haiyang on 16/09/13.
//
//

#import "GPBaseViewController+GPCategory.h"

@implementation GPBaseViewController (GPCategory)

@end


@implementation GPBaseViewController (UITableViewController)


- (void)hiddenExtraCellLineOfTableView:(UITableView *)tableView {
    
    UIView *view = [[UIView alloc] init];view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [tableView setTableHeaderView:view];
}


@end
