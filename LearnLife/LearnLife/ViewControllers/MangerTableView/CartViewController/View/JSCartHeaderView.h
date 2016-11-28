
/**
 *  @brief  每个分区的headerView
 *  @author ZZ
 *  @date   2016.8.16
 */

#import <UIKit/UIKit.h>

@interface JSCartHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) UIButton *selectStoreGoodsButton;

+ (CGFloat)getCartHeaderHeight;

@end
