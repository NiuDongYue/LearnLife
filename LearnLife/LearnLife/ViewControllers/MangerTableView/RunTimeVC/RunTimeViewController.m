

#import "RunTimeViewController.h"
#import "RunTimeExercise.h"

@interface RunTimeViewController ()

{
 
}

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 /*  RunTimeExercise *runTimeExercise = [[RunTimeExercise alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    Method m1 = class_getClassMethod([RunTimeExercise class], @selector(run));
    Method m2 = class_getClassMethod([RunTimeExercise class], @selector(stop));
    method_exchangeImplementations(m1, m2);

    [RunTimeExercise run];
    [RunTimeExercise stop];
  */
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] init];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(10, 110, 100, 20);
    firstButton.backgroundColor = [UIColor orangeColor];
    [[firstButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [dataDict setObject:@"1" forKey:@"time"];
        
        [[NSUserDefaults standardUserDefaults] setObject:dataDict forKey:@"name"];
    }];
    [self.view addSubview:firstButton];
    
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = CGRectMake(200, 110, 100, 20);
    secondButton.backgroundColor = [UIColor purpleColor];
    [[secondButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [dataDict setObject:@"1" forKey:@"secondtime"];
        
        [[NSUserDefaults standardUserDefaults] setObject:dataDict forKey:@"name"];
    }];
    
    [self.view addSubview:secondButton];
    
    
    UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    thirdButton.frame = CGRectMake(200, 150, 100, 20);
    thirdButton.backgroundColor = [UIColor redColor];
    [[thirdButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击了fsecondButton");
        NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"name"]);
        
    }];
    
    [self.view addSubview:thirdButton];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
