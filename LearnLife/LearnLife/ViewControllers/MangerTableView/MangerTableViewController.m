
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MangerTableViewController.h"
#import "RETableViewManager.h"
#import "RACViewController.h"
#import "TestXibAulayoutVC.h"
#import "CountDownViewController.h"
#import "RunTimeViewController.h"
#import "JSCartViewController.h"
#import "TableViewVideoViewController.h"
#import <EasyIOS/URLNavigation.h>
#import "CYLTabBarControllerConfig.h"
#import "LabelViewController.h"
#import "TextViewViewController.h"
#import "SelfManagerViewController.h"

@interface MangerTableViewController ()

@property(strong, nonatomic) RETableViewManager *manager;

@end

@implementation MangerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;

    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    
    [section addItem:[RETableViewItem itemWithTitle:@"美美美美美美美美美美美美美美美美美美美团" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
        //        self.window.rootViewController = tabBarControllerConfig.tabBarController;
        [URLNavigation setRootViewController:tabBarControllerConfig.tabBarController];
        
    }]];

    [section addItem:[RETableViewItem itemWithTitle:@"RAC练习" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        RACViewController  *racViewController = [[RACViewController alloc]
                init];
        [self.navigationController pushViewController:racViewController animated:YES];
    }]];

    [section addItem:[RETableViewItem itemWithTitle:@"xib自适应高度" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
         TestXibAulayoutVC *xibAulayoutVC = [[TestXibAulayoutVC alloc]
                init];
        [self.navigationController pushViewController:xibAulayoutVC animated:YES];
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"一些常用的宏" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"Push下级界面不会消失的倒计时" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        CountDownViewController *timeViewController = [[CountDownViewController alloc] init];
        [self.navigationController pushViewController:timeViewController animated:YES];
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"RunTime" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        RunTimeViewController *timeViewController = [[RunTimeViewController alloc] init];
        [self.navigationController pushViewController:timeViewController animated:YES];
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"遍历数组" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        NSArray  *array = @[@"1", @"2", @"3"];
        [array enumerateObjectsUsingBlock:^(NSString *str, NSUInteger idx, BOOL *stop) {
            NSLog(@"%@, %lu", str, (unsigned long)idx);
        }];
        
       NSInteger sum = [[array valueForKeyPath:@"@sum.floatValue"] integerValue];
        NSLog(@"sum == %ld", (long)sum);
        
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"监听程序从后台进入 + 查看是否回到主线程" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationWillResignActiveNotification object:nil] takeUntil:
          [self rac_willDeallocSignal] ] subscribeNext:^(id x) {
            NSLog(@"我进入后台");
            NSLog(@"NSThread == %@",  [NSThread currentThread]);
        }];
    }]];

    [section addItem:[RETableViewItem itemWithTitle:@"视频播放" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        TableViewVideoViewController *tableViewVideoViewController = [[TableViewVideoViewController alloc] init];
        [self.navigationController pushViewController:tableViewVideoViewController animated:YES];
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"购物车RAC + MVVM + 不错的效果" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        JSCartViewController *jsCartViewController = [[JSCartViewController alloc] init];
        [self.navigationController pushViewController:jsCartViewController animated:YES];
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"POP动画练习" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
//        POPViewController *popVC = [[POPViewController alloc] init];
//        [self.navigationController pushViewController:popVC animated:YES];
        
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"练习绘制一些Label的东西" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        LabelViewController *labelVC = [[LabelViewController alloc] init];
        [self.navigationController pushViewController:labelVC animated:YES];
        
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"Just Exercise Self.Manager" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        SelfManagerViewController *vc = [[SelfManagerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }]];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
