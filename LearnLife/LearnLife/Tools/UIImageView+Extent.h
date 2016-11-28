
/**
 * @brief:  简单包装了SDWebImage
 * @author: Hj
 * @date:   2016-05-22
 */


#import <UIKit/UIKit.h>

@interface UIImageView (Extent)

- (void)showWebImageWithURL:(NSString *)url;

- (void)showWebImageWithURL:(NSString *)url completedBlock:(void(^)(UIImage*))completedBlock;

- (void)showWebImageWithURL:(NSString *)url placeHolder:(NSString*)placeHolder completedBlock:(void(^)(UIImage*))completedBlock;

- (void)showLevelImageWithName:(NSString *)lvl;

@end
