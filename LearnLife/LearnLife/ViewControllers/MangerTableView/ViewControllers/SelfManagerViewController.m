
#import "SelfManagerViewController.h"
#import "ManagerControl.h"

@interface SelfManagerViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SelfManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

//    [ManagerControl showManagerViewInView:self.view];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  40;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array =  tableView.indexPathsForVisibleRows;
    NSIndexPath *firstIndexPath = array[0];
    
    //设置anchorPoint
    cell.layer.anchorPoint = CGPointMake(0, 1);
    //为了防止cell视图移动，重新把cell放回原来的位置
    cell.layer.position = CGPointMake(0, cell.layer.position.y);
    
    
    //设置cell 按照z轴旋转90度，注意是弧度
    if (firstIndexPath.row < indexPath.row) {
        cell.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1.0);
    }else{
        cell.layer.transform = CATransform3DMakeRotation(- M_PI, 0, 0, 1.0);
    }
    cell.alpha = 0.5;
    
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1.0;
    }];

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
