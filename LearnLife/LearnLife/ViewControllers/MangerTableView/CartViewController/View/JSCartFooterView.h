
/**
 *  @brief  每个分区的FootView
 *  @author ZZ
 *  @date   2016.8.16
 */

#import <UIKit/UIKit.h>

@interface JSCartFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong) NSMutableArray *shopGoodsArray;

+ (CGFloat)getCartFooterHeight;

@end
