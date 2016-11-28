
/**
 *  @brief  首页轮播（没加定时轮播）
 *  @author zz
 *  @date   2016.8.28
 */

#import <UIKit/UIKit.h>

@interface HomeScrollView : UIView

@property (nonatomic, copy) void(^scrollHeaderViewAction)(HomeScrollView *, NSInteger);

@end
