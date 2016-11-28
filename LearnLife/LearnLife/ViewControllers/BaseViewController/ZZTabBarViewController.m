
#import "ZZTabBarViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"

@interface ZZTabBarViewController ()

@end

@implementation ZZTabBarViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    [self setViewControllers:@[[[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]],[[UINavigationController alloc] initWithRootViewController:[[RankViewController alloc] init]],[[UINavigationController alloc] initWithRootViewController:[[MineViewController alloc] init]]]];
//     
    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL *stop) {
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"333333"]} forState:UIControlStateSelected];
        switch (idx) {
            case 0:
            {
                vc.tabBarItem.image = nil;
                [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"333333"]} forState:UIControlStateSelected];
                UIImage *image =[UIImage imageNamed:@"tab_home_active.png"];
                image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                vc.tabBarItem.selectedImage = image;
                vc.title = @"首页";
            }
                break;
            case 1:
            {
                vc.tabBarItem.image = [UIImage imageNamed:@"tab_fenLei_normal.png"];
                UIImage *image =[UIImage imageNamed:@"tab_fenLei_active.png"];
                
                image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                vc.tabBarItem.selectedImage = image;
                vc.title = @"排行榜";
            }
                break;
            case 2:
            {
                vc.tabBarItem.image = [UIImage imageNamed:@"tab_cart_normal.png"];
                UIImage *image =[UIImage imageNamed:@"tab_cart_active.png"];
                image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                vc.tabBarItem.selectedImage = image;
                vc.title = @"我的";
            }
                break;
          
            default:
                break;
        }
    }];

    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
