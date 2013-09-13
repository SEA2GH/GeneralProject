//
//  GPBaseCell.h
//  GeneralProject
//
//  Created by guo haiyang on 13/09/13.
//
//

#import <UIKit/UIKit.h>

@protocol GPBaseCellDelegate;

@interface GPBaseCell : UITableViewCell

@property (nonatomic, weak) id<GPBaseCellDelegate> delegate;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end

@protocol GPBaseCellDelegate <NSObject>

@required
- (void)cell:(GPBaseCell *)cell clickedElement:(UIView *)element atIndexPath:(NSIndexPath *)indexPath;

@end
