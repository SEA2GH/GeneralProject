//
//  GPBaseCell.m
//  GeneralProject
//
//  Created by guo haiyang on 13/09/13.
//
//

#import "GPBaseCell.h"

@implementation GPBaseCell

@synthesize delegate;
@synthesize indexPath;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
