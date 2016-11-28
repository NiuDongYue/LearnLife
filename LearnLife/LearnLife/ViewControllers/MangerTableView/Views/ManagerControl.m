
#import "ManagerControl.h"
#import "ManagerView.h"

@implementation ManagerControl

+ (void)showManagerViewInView:(UIView *)view {
    ManagerView *managerView = [[ManagerView alloc] initWithFrame:CGRectMake(0, 100, view.width, 200)];
    managerView.backgroundColor = [UIColor brownColor];
    [view addSubview:managerView];
}

@end
