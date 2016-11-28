
#import "LabelViewController.h"

@interface LabelViewController ()

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *layerView= [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    layerView.layer.masksToBounds = YES;
    [self configLayer:layerView.layer];
    
    //create a square shadow
//    CGMutablePathRef squarePath = CGPathCreateMutable();
//    CGPathAddRect(squarePath, NULL, layerView.bounds);
//    layerView.layer.shadowPath = squarePath; CGPathRelease(squarePath);
    
    //create a circular shadow
//    CGMutablePathRef circlePath = CGPathCreateWithRect(CGRectMake(105, 0, 5, 100), nil);
//    CGPathAddEllipseInRect(circlePath, NULL, layerView.bounds);
//    layerView.layer.shadowPath = circlePath; CGPathRelease(circlePath);
    
    [self.view addSubview:layerView];
    
    // Do any additional setup after loading the view.
}

- (void)configLayer:(CALayer *)layer {
    layer.cornerRadius = 20;
    layer.borderWidth = 10;
    layer.borderColor = [UIColor yellowColor].CGColor;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 0.3;
    layer.shadowOffset = CGSizeMake(-20, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
