
/**
 *  @brief   设置视频的分辨率等信息
 *  @author   zz
 *  @date     2016.8.18
 */

#import <Foundation/Foundation.h>

@interface ZFPlyerResolution : NSObject
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, copy  ) NSString  *name;
@property (nonatomic, copy  ) NSString  *type;
@property (nonatomic, copy  ) NSString  *url;
@end
