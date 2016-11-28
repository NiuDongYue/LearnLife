
#import "HomeNavigationBar.h"

@implementation HomeNavigationBar

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createTap];
    }
    return self;
}

- (void)createTap {
    UITapGestureRecognizer *cityTap = [[UITapGestureRecognizer alloc] init];
    [[cityTap rac_gestureSignal] subscribeNext:^(id x) {
        [self sendClickAcitonWithType:navigationBarCity];
    }];
    [self.cityLabel addGestureRecognizer:cityTap];
    
    
    UITapGestureRecognizer *arrowTap = [[UITapGestureRecognizer alloc] init];
    [[arrowTap rac_gestureSignal] subscribeNext:^(id x) {
        [self sendClickAcitonWithType:navigationBarArrow];

    }];
    [self.arrowImageView addGestureRecognizer:arrowTap];
    
    
    UITapGestureRecognizer *searchTap = [[UITapGestureRecognizer alloc] init];
    [[searchTap rac_gestureSignal] subscribeNext:^(id x) {
        [self sendClickAcitonWithType:navigationBarSearch];

    }];
    [self.searchImageView addGestureRecognizer:searchTap];
    
    
    UITapGestureRecognizer *scanTap = [[UITapGestureRecognizer alloc] init];
    [[scanTap rac_gestureSignal] subscribeNext:^(id x) {
        [self sendClickAcitonWithType:navigationBarScan];

    }];
    [self.scanImageView addGestureRecognizer:scanTap];
    
    
    
    UITapGestureRecognizer *meassgeTap = [[UITapGestureRecognizer alloc] init];
    [[meassgeTap rac_gestureSignal] subscribeNext:^(id x) {
        [self sendClickAcitonWithType:navigationBarMessage];

    }];
    [self.messageImageView addGestureRecognizer:meassgeTap];
    
}

- (void)sendClickAcitonWithType:(NSInteger)type {
    if (self.homeBarActionWithType) {
        self.homeBarActionWithType(self, type);
    }
}

@end
