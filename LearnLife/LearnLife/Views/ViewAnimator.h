/*
 * @brief:  view的一些动画
 * @author: Hj
 * @date:   2016-05-20
 */

@interface ViewAnimator : NSObject

+ (void)moveViewCenter:(UIView *)view to:(CGPoint)to completion:(void (^)(UIView *))block;
+ (void)moveCenterY:(UIView *)view to:(CGFloat)y completion:(void (^)(UIView *))block;

+ (void)opacityView:(UIView *)view to:(CGFloat)toValue completion:(void (^)(UIView *))block;

+ (void)showUp:(UIView*)view toPosition:(CGPoint)toPosition completion:(void(^)(UIView *))block;

+ (void)showUpStraight:(UIView*)view toPosition:(CGPoint)toPosition completion:(void(^)(UIView *))block;

+ (void)dismiss:(UIView*)view toPosition:(CGPoint)toPosition completion:(void(^)(UIView *))block;

+ (void)fadeOut:(UIView *)view completion:(void(^)(UIView *))completion;

+ (void)showUpWithScale:(UIView*)view completion:(void(^)(UIView *))block;

+ (void)showUpWithShareView:(UIView *)view fromPosition:(CGPoint )fromPoint toPosition:(CGPoint )toPoint completion:(void(^)(UIView *))block;

@end