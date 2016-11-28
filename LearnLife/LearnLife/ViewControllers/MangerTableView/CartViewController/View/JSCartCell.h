
/**
 *  @brief  cartCell 
 *  @author ZZ
 *  @date   2016.8.16
 */

#import <UIKit/UIKit.h>

@class JSCartModel,JSNummberCount;

@interface JSCartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;

@property (weak, nonatomic) IBOutlet UIButton *selectShopGoodsButton;

@property (weak, nonatomic) IBOutlet JSNummberCount *nummberCount;

@property (nonatomic, strong) JSCartModel *model;

@property (nonatomic, copy) void(^clickGoodsImageViewAction)(JSCartCell *);

+ (CGFloat)getCartCellHeight;

@end
