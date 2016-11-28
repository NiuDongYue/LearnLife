
#import "JSCartCell.h"
#import "JSNummberCount.h"
#import "JSCartModel.h"

@interface JSCartCell ()

@property (weak, nonatomic) IBOutlet UILabel        *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel        *GoodsPricesLabel;

@end

@implementation JSCartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    WEAK
    UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc] init];
    [[imageTap rac_gestureSignal] subscribeNext:^(id x) {
        STRONG
        if (self.clickGoodsImageViewAction) {
            self.clickGoodsImageViewAction(self);
        }
    }];
    [self.goodsImageView addGestureRecognizer:imageTap];
}

- (void)setModel:(JSCartModel *)model {
    
    self.goodsNameLabel.text             = model.p_name;
    self.GoodsPricesLabel.text           = [NSString stringWithFormat:@"￥%.2f", model.p_price];
    self.nummberCount.totalNum           = model.p_stock;
    self.nummberCount.currentCountNumber = model.p_quantity;
    self.selectShopGoodsButton.selected  = model.isSelect;
    self.goodsImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", model.p_imageUrl]];
}

+ (CGFloat)getCartCellHeight{
    
    return 100;
}

@end
