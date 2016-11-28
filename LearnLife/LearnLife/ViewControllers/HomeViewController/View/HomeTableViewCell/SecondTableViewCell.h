
/**
 *  @brief  首页第二个Cell
 *  @author zz
 *  @date   2016.8.28
 */

#import <UIKit/UIKit.h>

@interface SecondTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *secondHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *secondHeadView;

@property (nonatomic, copy) void(^clickItemAction)(SecondTableViewCell *, NSInteger);

@end
