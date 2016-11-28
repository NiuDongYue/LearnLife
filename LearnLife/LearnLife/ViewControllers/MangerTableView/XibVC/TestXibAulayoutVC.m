
#import "TestXibAulayoutVC.h"
#import "XibAulayoutTableViewCell.h"
#import "AulayoutModel.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "Easy.h"

@interface TestXibAulayoutVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *myDataSource;

@end

@implementation TestXibAulayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataSource = [[NSMutableArray alloc] init];
    self.myDataSource = [[NSMutableArray alloc] init];

    self.dataSource = [@[
            @{@"headImageStr" : @"image-0", @"contentStr" : @"宝宝宝宝宝宝宝宝宝宝宝      宝宝宝宝宝宝宝贝", @"dateStr" : @"2016.08.08"},
            @{@"headImageStr" : @"image-0", @"contentStr" : @"宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝贝", @"dateStr" : @"2016.08.08"},
            @{@"headImageStr" : @"image-0", @"contentStr" : @"宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝贝", @"dateStr" : @"2016.08.08"},
            @{@"headImageStr" : @"image-0", @"contentStr" : @"宝宝宝宝宝宝宝宝宝宝宝贝", @"dateStr" : @"2016.08.08"},
            @{@"headImageStr" : @"image-0", @"contentStr" : @"宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝宝贝", @"dateStr" : @"2016.08.08"}] mutableCopy];
    
    for (NSInteger index = 0; index < 3; index++) {
        
        [self.dataSource addObjectsFromArray:self.dataSource];
    }
    
    for (NSDictionary *dict in self.dataSource) {
        
        [self.myDataSource addObject:[AulayoutModel mj_objectWithKeyValues:dict]];
    }
    [self createUI];

//    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    @weakify(self);
    XibAulayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XibAulayoutTableViewCell" owner:self options:nil] lastObject];
    }
    AulayoutModel *model = self.myDataSource[indexPath.row];
    cell.model = model;
    cell.clickCellAction = ^(XibAulayoutTableViewCell *cell1) {
        @strongify(self);
        NSLog(@"点击了cell");
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AulayoutModel *model;
    model = [self.myDataSource safeObjectAtIndex:indexPath.row];
    
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[XibAulayoutTableViewCell class] contentViewWidth:[self cellContentViewWith]];
}

- (CGFloat)cellContentViewWith {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (void)dealloc {

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
