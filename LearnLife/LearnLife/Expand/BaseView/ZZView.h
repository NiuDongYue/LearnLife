
/**
 *  @brief  BaseView 自动从nib加载
 *  @author hj
 *  date    2016.8.8
 */


typedef void(^ButtonTouchBlock)(UIButton *button, UIView* view);

@interface ZZView : UIView

- (id)initWithFrame:(CGRect)frame;
- (void)setupContent;


// default is YES
@property (nonatomic, assign) BOOL clickEnable;
@property (nonatomic, strong) UIView *contentView;

@end