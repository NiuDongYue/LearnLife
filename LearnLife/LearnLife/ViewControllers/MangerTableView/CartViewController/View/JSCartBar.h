
/**
 *  @brief  底部cartBar
 *  @author ZZ
 *  @date   2016.8.16
 */

#import <UIKit/UIKit.h>

@interface JSCartBar : UIView

//结算
@property (nonatomic, strong) UIButton *balanceButton;
//全选
@property (nonatomic, strong) UIButton *selectAllButton;
//价格
@property (nonatomic, retain) UILabel *allMoneyLabel;
//删除
@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, assign) BOOL     isNormalState;

@property (nonatomic, assign) float    money;

@end
