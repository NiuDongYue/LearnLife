
/**
 *  @brief  首页第一个Cell
 *  @author zz
 *  @date   2016.8.28
 */

#import <UIKit/UIKit.h>

@interface FirstTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *buyView;
@property (weak, nonatomic) IBOutlet UILabel *storeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountPriceLabel;

@property (weak, nonatomic) IBOutlet UIView *specialPriceView;
@property (weak, nonatomic) IBOutlet UILabel *specialPriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *specialImageView;

@property (weak, nonatomic) IBOutlet UIView *awayFoodView;
@property (weak, nonatomic) IBOutlet UIView *awayFoodLabel;
@property (weak, nonatomic) IBOutlet UIImageView *awayFoodImageView;




@end
