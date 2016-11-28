
#import "ButtonAnimationViewController.h"
#import "NWMainButton.h"

@interface ButtonAnimationViewController ()

@end

@implementation ButtonAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)shakeButton:(id)sender {
    NWMainButton *shakeButton = sender;
    [shakeButton startLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [shakeButton stopLoading];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [shakeButton shake];
    });
    
}

- (IBAction)jumpButton:(id)sender {
    NWMainButton *shakeButton = sender;
    [shakeButton jump];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [shakeButton stopJump];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
