#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACViewController.h"
#import "UIImage+Extend.h"
#import "UIView+SDAutoLayout.h"
#import "UIViewController+CYLTabBarControllerExtention.h"

#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

@interface RACViewController ()

{
    UILabel *arrayLabel;
}

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
    
    [self createUI];
}

- (void)createUI {
    @weakify(self);
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 50, 30)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"只有当textField有内容才可以发通知" forState:UIControlStateNormal];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击了button");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RefreshRAC" object:@"1"];
    }];
    [self.view addSubview:button];
    
    
    UITextField  *textField = [[UITextField alloc] initWithFrame:CGRectMake(150, 200, 100 ,30)];
    textField.placeholder = @"根据长度改变颜色";
    [self.view addSubview:textField];
    
    RACSignal *bgColor = [textField.rac_textSignal map:^id(NSString *value) {
        return (value.length > 3) ? [UIColor purpleColor] :[UIColor grayColor];
    }];
    RAC(textField, backgroundColor) = bgColor;

    
    UITextField *secondTextField = [[UITextField alloc] initWithFrame:CGRectMake(150, 250, 100, 30)];
    secondTextField.placeholder = @"帅帅的ZZ";
    [self.view addSubview:secondTextField];
    RACSignal *bgColor1 = [textField.rac_textSignal map:^id(NSString *value) {
        return (value.length > 3) ? [UIColor purpleColor] :[UIColor grayColor];
    }];
    RAC(secondTextField, backgroundColor) = bgColor1;

    //merge相当于或的意思 两个条件只要满足其中的一个 就可以执行
//    RACSignal *bgColor = [[RACSignal merge:@[textField.rac_textSignal, secondTextField.rac_textSignal]] map:^id(NSString *value) {
//        return (value.length > 3) ? [UIColor purpleColor] : [UIColor orangeColor];
//    }];



    //combineLatest 相当于&&的意思 reduce是讲两个信号整合后发送  必须两个条件都满足了才会返回值
    RACSignal *fromValid = [RACSignal combineLatest:@[textField.rac_textSignal, secondTextField.rac_textSignal] reduce:^id(NSString *text1, NSString *text2){
        return @(text1.length && text2.length) ;
    }];
    
    RAC(button, enabled) = fromValid;


    UIButton *editeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 150, 20)];
    [editeButton setTitle:@"有输入才可点击" forState:UIControlStateNormal];
    RAC(editeButton, enabled) = [RACSignal combineLatest:@[textField.rac_textSignal] reduce:^(NSString *text) {
        return @(text.length>3) ;
    }];
    [[editeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"满足条件的点击");
    }];
    [self.view addSubview:editeButton];
    
    
    //组合数组
    RACTuple  *tuple = RACTuplePack(@(1), @(2));
    NSLog(@"tuple == %@", tuple);
    
    
    UIButton *colorBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 100, 30)];
    colorBtn.backgroundColor = [UIColor redColor];
    [colorBtn setTitle:@"跳转到主页面" forState:UIControlStateNormal];
    
    [[colorBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        STRONG
        [self cyl_popSelectTabBarChildViewControllerAtIndex:0];
    }];
    
    [self.view addSubview:colorBtn];
    
    
    UIImageView  *imageView = [[UIImageView alloc] init];
    imageView.image = kGetImage(@"image-0");
    imageView.frame = CGRectMake(50, 250, 50, 50);
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        NSLog(@"点击了图片");
    }];
    [imageView addGestureRecognizer:tap];
    [imageView.image cutCircleImage];
    [self.view addSubview:imageView];
    
    
    UILabel *someLabel = [[UILabel alloc] init];
    someLabel.backgroundColor = [UIColor orangeColor];
    someLabel.text = [NSString stringWithFormat:@"运用RAC通知的时候大部分需在通知后面要加takeUntil 才能移除通知写法为：[[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationWillResignActiveNotification object:nil] takeUntil:[self rac_willDeallocSignal]] subscribeNext:^(id x) {}]"];
    [self.view addSubview:someLabel];
    
    someLabel.sd_layout
    .bottomSpaceToView(self.view, 50)
    .rightSpaceToView(self.view, 10)
    .widthIs(300)
    .autoHeightRatio(0);
    
    arrayLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor orangeColor];
        label.userInteractionEnabled = YES;
        label.text = @"对数组进行过滤遍历";
        
        NSArray *array = @[@"1", @"2", @"3"];
        
        UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        [[tapGestureRecognizer rac_gestureSignal] subscribeNext:^(id x) {
            [[array.rac_sequence.signal ignore:@"2"] subscribeNext:^(id x) {
                NSLog(@"%@", x);
            }];
        }];
        [label addGestureRecognizer:tapGestureRecognizer];
        
        [self.view addSubview:label];

        label.sd_layout
        .topSpaceToView(self.view, 100)
        .rightSpaceToView(self.view, 10)
        .widthIs(150)
        .autoHeightRatio(0);

        label;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
