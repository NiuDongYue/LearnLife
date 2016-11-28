

#import "UIImageView+Extent.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (Extent)

- (void)showWebImageWithURL:(NSString *)url {
    [self showWebImageWithURL:url completedBlock:nil];
}

- (void)showWebImageWithURL:(NSString *)url completedBlock:(void(^)(UIImage*))completedBlock {
    [self showWebImageWithURL:url placeHolder:nil completedBlock:completedBlock];
}

- (void)showWebImageWithURL:(NSString *)url placeHolder:(NSString*)placeHolder completedBlock:(void(^)(UIImage*))completedBlock {
    if ((url.length == 0 || url == nil) && nil == placeHolder) {
        return;
    }
//
//    if ([url rangeOfString:@"http"].location == NSNotFound) {
//        url = [NSString stringWithFormat:@"%@%@", CURRENTLOGIN.res_url, url];
//    }
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeHolder ? [UIImage imageNamed:placeHolder] : nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image);
        }
    }];
}

- (void)showLevelImageWithName:(NSString *)lvl {
    //    NSString *string = [DATACENTER.configModel userLevelWithLvl:lvl];
    //    if (string){
    //        [self showWebImageWithURL:string];
    //    } else {
    self.image = [UIImage imageNamed:[NSString stringWithFormat:@"lv%@",lvl]];
    //    }
}

@end
