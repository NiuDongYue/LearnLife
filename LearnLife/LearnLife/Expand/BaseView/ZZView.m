
#import "ZZView.h"

@implementation ZZView {
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContent];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupContent];
}

- (void)setupContent {
    _clickEnable = YES;
    
    NSString *className = NSStringFromClass([self class]);
    if([[NSBundle mainBundle] pathForResource:className ofType:@"nib"]) {
        UINib* nib = [UINib nibWithNibName:className bundle:nil];
        if (nib) {
            _contentView = [nib instantiateWithOwner:self options:nil][0];
            if (_contentView) {
                _contentView.frame = self.bounds;
                [self addSubview:_contentView];
            }
        }
    }
}

- (id)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id hitView = [super hitTest:point withEvent:event];
    if (hitView == self && !_clickEnable) return nil;
    else return hitView;
}

@end