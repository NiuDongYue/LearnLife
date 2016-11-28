#import "NWMainButton.h"
#import <POP/POP.h>

@interface NWMainButton ()

@property (nonatomic, strong) UIActivityIndicatorView *loadingActivity;
@property (nonatomic, strong) NSString *textString;

@end

@implementation NWMainButton

+ (instancetype)button {
    return [self buttonWithType:UIButtonTypeCustom];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _jumping = NO;
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self setup];
}

- (void)setup {
    [self addTarget:self action:@selector(scaleToSmall) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(scaleAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(scaleToDefault) forControlEvents:UIControlEventTouchDragExit];
}

- (void)setupDefaultColor {
    UIColor *mainColor = RGB(11, 198, 121);
    UIImage *normalImage = [UIImage imageWithColor:[UIColor mainColor] size:self.bounds.size];
    UIColor *color = [UIColor mainColor];
    UIImage *selectImage = [UIImage imageWithColor:[color colorWithAlphaComponent:.6] size:self.bounds.size];
    UIImage *enableImage = [UIImage imageWithColor:[UIColor lightGrayColor] size:self.bounds.size];

    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:selectImage forState:UIControlStateSelected];
    [self setBackgroundImage:enableImage forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:.5] forState:UIControlStateDisabled];
}

- (void)setupDefaultCorner {
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
}
- (void)setupLoginStyleColor{
    [self setBackgroundImage:[UIImage imageWithColor:RGB(13,35,56) size:self.bounds.size] forState:UIControlStateNormal];
    [self setTitleColor:RGB(183,235,254) forState:UIControlStateNormal];
}
- (void)setupLoginStyleCorner{
    self.layer.borderColor = RGB(114,162,180).CGColor;
    self.layer.borderWidth = 1;
    
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
}

- (void)scaleToSmall {
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95f, 0.95f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
}

- (void)scaleAnimation {
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 18.0f;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
}

- (void)scaleToDefault {
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
}

- (void)shake {
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = @2000;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        self.userInteractionEnabled = YES;
    }];
    [self.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

- (void)startLoading {
    if (!_loadingActivity) {
        _loadingActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        double size = self.bounds.size.height * 0.8;
        _loadingActivity.frame = CGRectMake(0, 0, (CGFloat)size, (CGFloat)size);
        _loadingActivity.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        [self addSubview:_loadingActivity];
    }
    _loadingActivity.hidden = NO;
    [_loadingActivity startAnimating];

    self.titleLabel.layer.opacity = 0;
    self.enabled = NO;
}

- (void)stopLoading {
    [_loadingActivity stopAnimating];
    _loadingActivity.hidden = YES;
    self.enabled = YES;

    self.titleLabel.layer.opacity = 1;
}

- (void)jump {
    _jumping = YES;

    POPBasicAnimation *jumpHigh = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    jumpHigh.toValue = @(self.center.y - 10);
    jumpHigh.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];;
    jumpHigh.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        POPBasicAnimation *jumpHigh = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        jumpHigh.toValue = @(self.center.y - 10);
        jumpHigh.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];;
        jumpHigh.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        };
    };
}

- (void)stopJump {
    _jumping = NO;
}

@end