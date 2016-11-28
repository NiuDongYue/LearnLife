
/**
 *  @brief  视频cell Model
 *  @from   http://github.com/renzifeng
 *  @author zz
 *  @date   2016.8.18
 */

#import <Foundation/Foundation.h>
#import "ZFPlyerResolution.h"

@interface ZFPlayerModel : NSObject

/** 标题 */
@property (nonatomic, copy  ) NSString *title;
/** 描述 */
@property (nonatomic, copy  ) NSString *video_description;
/** 视频地址 */
@property (nonatomic, copy  ) NSString *playUrl;
/** 封面图 */
@property (nonatomic, copy  ) NSString *coverForFeed;
/** 视频分辨率的数组 */
@property (nonatomic, strong) NSMutableArray *playInfo;

@end
