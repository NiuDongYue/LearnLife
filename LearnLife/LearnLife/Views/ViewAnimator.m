#import "ViewAnimator.h"

@implementation ViewAnimator
+ (void)moveViewCenter:(UIView *)view to:(CGPoint)to completion:(void (^)(UIView *))block {

    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:to];
    positionAnimation.springBounciness = 10;
    @weakify(view);
    positionAnimation.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        @strongify(view);
        if (block) {
            block(view);
        }
    };
    [view.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];

    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 20;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.1, 1.1)];
    [view.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];

}
+ (void)moveCenterY:(UIView *)view to:(CGFloat)y completion:(void (^)(UIView *))block {
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.toValue = @(y);
    positionAnimation.springBounciness = 10;
    @weakify(view);
    positionAnimation.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        @strongify(view);
        if (block) {
            block(view);
        }
    };
    [view.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];

    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 20;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.1, 1.1)];
    [view.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}
+ (void)opacityView:(UIView *)view to:(CGFloat)toValue completion:(void (^)(UIView *))block{
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.duration = 0.5;
    opacityAnimation.toValue = @(toValue);
    @weakify(view);
    opacityAnimation.completionBlock = ^(POPAnimation* animation, BOOL finished) {
        @strongify(view);
        [view removeFromSuperview];
    };
    [view.layer pop_addAnimation:opacityAnimation forKey:@"opacity"];
}
+ (void)showUp:(UIView *)view toPosition:(CGPoint)toPosition completion:(void (^)(UIView *))block {
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:toPosition];
    positionAnimation.springBounciness = 10;

    @weakify(view);
    positionAnimation.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        @strongify(view);
        if (block) {
            block(view);
        }
    };

    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 20;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];

    [view.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [view.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

+ (void)showUpStraight:(UIView *)view toPosition:(CGPoint)toPosition completion:(void (^)(UIView *))block {
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:toPosition];

    @weakify(view);
    positionAnimation.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        @strongify(view);
        if (block) {
            block(view);
        }
    };

    [view.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

+ (void)dismiss:(UIView *)view toPosition:(CGPoint)toPosition completion:(void (^)(UIView *))block {
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    offscreenAnimation.duration = 0.5;
    offscreenAnimation.toValue = [NSValue valueWithCGPoint:toPosition];

    @weakify(view);
    offscreenAnimation.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        @strongify(view);
        if (block) {
            block(view);
        }
    };

    [view.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

+ (void)fadeOut:(UIView *)view completion:(void (^)(UIView *))completion {
    if (nil != view) {
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        anim.fromValue = @(1.0);
        anim.toValue = @(0.0);
        @weakify(view);
        anim.completionBlock = ^(POPAnimation *animation, BOOL finished) {
            @strongify(view);
            if (completion) {
                completion(view);
            }
        };
        [view pop_addAnimation:anim forKey:@"fade"];
    }
}

+ (void)showUpWithScale:(UIView *)view completion:(void (^)(UIView *))block {
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 20;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    [view.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

+ (void)showUpWithShareView:(UIView *)view fromPosition:(CGPoint)fromPoint toPosition:(CGPoint)toPoint completion:(void (^)(UIView *))block {
    POPBasicAnimation *shareViewAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    shareViewAnimation.duration = 0.25;
    shareViewAnimation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    shareViewAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    [view.layer pop_addAnimation:shareViewAnimation forKey:@"shareAnimation"];
}

@end
