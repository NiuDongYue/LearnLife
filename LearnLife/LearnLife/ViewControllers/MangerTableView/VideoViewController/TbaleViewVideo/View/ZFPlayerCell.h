
/**
 *  @brief  Video cell
 *  @author zz
 *  @date   2016.8.18
 */

#import <UIKit/UIKit.h>
#import "ZFPlayer.h"
#import "ZFPlayerModel.h"

typedef void(^PlayBtnCallBackBlock)(UIButton *);

typedef enum {
    btnTypePraise = 1,
    btnTypeUnpraise,
    btnTypeShare,
    btnTypeMessage,
    
} btnType;

@interface ZFPlayerCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (weak, nonatomic) IBOutlet UIImageView *picView;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property (nonatomic, strong) UIButton             *playBtn;
/** model */
@property (nonatomic, strong) ZFPlayerModel        *model;
/** 播放按钮block */
@property (nonatomic, copy  ) PlayBtnCallBackBlock playBlock;

@property (weak, nonatomic) IBOutlet UIButton *praiseBtn;
@property (weak, nonatomic) IBOutlet UIButton *unpraiseBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;

@property (nonatomic, copy) void (^clickBtnWithType)(ZFPlayerCell *, NSInteger btnType);


@end
