

#import <UIKit/UIKit.h>
#import "AulayoutModel.h"

@interface XibAulayoutTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;

@property (nonatomic, copy) void(^clickCellAction)(XibAulayoutTableViewCell *cell);

@property (nonatomic, strong) AulayoutModel *model;

@end
