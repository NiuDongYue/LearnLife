
/**
 *  @brief  HomeNaviBar
 *  @author zz
 *  @date   2016.8.28
 */


typedef enum {
    navigationBarCity = 0,
    navigationBarArrow,
    navigationBarSearch,
    navigationBarScan,
    navigationBarMessage
    
} clickHomeNavBarImageViewType;


#import <UIKit/UIKit.h>
#import "ZZView.h"


@interface HomeNavigationBar : ZZView

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UIImageView *searchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *scanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *messageImageView;

@property (nonatomic, copy) void(^homeBarActionWithType)(HomeNavigationBar *, NSInteger);

@end
