
#import "HomeViewController.h"
#import "FourthPartTableViewCell.h"
#import "HomeNavigationBar.h"
#import "HomeScrollView.h"
#import "FirstTableViewCell.h"
#import "swift-bridge.h"
#import "SecondTableViewCell.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeNavigationBar *homeNavigationBar;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.tabBarItem setBadgeValue:@"3"];
    
    [self createUI];

}

- (void)createUI {
    self.view.userInteractionEnabled = YES;
    self.navigationItem.titleView = self.homeNavigationBar;
    

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self createTableHeaderView];
}

- (void)createTableHeaderView {
    WEAK
     HomeScrollView *homeScrollView = [[HomeScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    
    homeScrollView.scrollHeaderViewAction = ^(HomeScrollView *view, NSInteger index) {
    STRONG
        NSLog(@"%ld", (long)index);
    };
    
    self.tableView.tableHeaderView = homeScrollView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
WEAK
    if (indexPath.section == 0) {
        FirstTableViewCell *firstTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"firstTableViewCell"];
        
        if (!firstTableViewCell) {
            firstTableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"FirstTableViewCell" owner:self options:nil] firstObject];
        }
        firstTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [firstTableViewCell.buyView whenTapped:^{
          //涉及到自己 加  STRONG
            NSLog(@"点击了buyView");
        }];
        
        [firstTableViewCell.specialPriceView whenTapped:^{
            NSLog(@"点击了specialView");
        }];
        
        [firstTableViewCell.awayFoodView whenTapped:^{
            NSLog(@"点击了awayFoodView");
        }];
        
        return firstTableViewCell;
    }
    
    else if (indexPath.section == 1) {
        SecondTableViewCell *secondTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"secondTableViewCell"];
        if (!secondTableViewCell) {
            secondTableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"SecondTableViewCell" owner:self options:nil] firstObject];
        }
        [secondTableViewCell.secondHeadView whenTapped:^{
            NSLog(@"点击了第二分区的headerView");
        }];
        
        secondTableViewCell.clickItemAction = ^(SecondTableViewCell *cell, NSInteger idex) {
            NSLog(@"点击的Collection indexpath.item = %ld", (long)idex);
        };
        
        secondTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return secondTableViewCell;
    }    
    else {
        
    static NSString *cellId = @"cellId";

    FourthPartTableViewCell *fourthPartTableViewCell = [tableView dequeueReusableCellWithIdentifier:cellId];

    if (!fourthPartTableViewCell) {
        fourthPartTableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"FourthPartTableViewCell" owner:self options:nil] lastObject];
    }
    fourthPartTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return fourthPartTableViewCell;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 1;
    }

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 120;
    }
    
    else if (indexPath.section == 1) {
        return 250;
    }
    
    else {
    return 110;
    }
}

- (HomeNavigationBar *)homeNavigationBar {
    WEAK
    if (!_homeNavigationBar) {
        _homeNavigationBar = [[HomeNavigationBar alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
    }
    _homeNavigationBar.homeBarActionWithType = ^(HomeNavigationBar *barView, NSInteger clickType) {
        STRONG
        // do  something with clickType
        NSLog(@"%ld", (long)clickType);
        
    };
    
    return _homeNavigationBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
