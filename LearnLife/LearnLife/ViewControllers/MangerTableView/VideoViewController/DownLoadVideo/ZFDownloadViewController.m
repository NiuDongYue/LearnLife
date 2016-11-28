
#import "ZFDownloadViewController.h"
#import "MoviePlayerViewController.h"
#import "ZFPlayer.h"
#import "ZFDownloadingCell.h"
#import "ZFDownloadedCell.h"
#import <ZFDownload/ZFDownloadManager.h>

@interface ZFDownloadViewController ()<UITableViewDataSource,UITableViewDelegate,ZFDownloadDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (atomic, strong) NSMutableArray *downloadObjectArr;
@property (nonatomic, strong) ZFDownloadManager *downloadManage;

@end

@implementation ZFDownloadViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBarHidden = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    // 更新数据源
    [self initData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.downloadManage.downloadDelegate = self;
    [self.view addSubview:self.tableView];
    NSLog(@"%@", NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES));
}

- (void)initData
{
    [self.downloadManage startLoad];
    NSMutableArray *downladed = self.downloadManage.finishedlist;
    NSMutableArray *downloading = self.downloadManage.downinglist;
    self.downloadObjectArr = @[].mutableCopy;
    [self.downloadObjectArr addObject:downladed];
    [self.downloadObjectArr addObject:downloading];
    [self.tableView reloadData];
}

- (ZFDownloadManager *)downloadManage
{
    if (!_downloadManage) {
        _downloadManage = [ZFDownloadManager sharedDownloadManager];
    }
    return _downloadManage;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
   
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = self.downloadObjectArr[section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        static NSString *cellId = @"downloadCell";
        ZFDownloadedCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZFDownloadedCell" owner:self options:nil] lastObject];
        }
        ZFFileModel *fileInfo = self.downloadObjectArr[indexPath.section][indexPath.row];
        cell.fileInfo = fileInfo;
        return cell;
        
    } else if (indexPath.section == 1) {
        
        static NSString *cellId = @"downloadingCell";
        ZFDownloadingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell =[[[NSBundle mainBundle] loadNibNamed:@"ZFDownloadingCell" owner:self options:nil] lastObject];
        }
        ZFHttpRequest *request = self.downloadObjectArr[indexPath.section][indexPath.row];
        if (request == nil) { return nil; }
        ZFFileModel *fileInfo = [request.userInfo objectForKey:@"File"];

        __weak typeof(self) weakSelf = self;
        // 下载按钮点击时候的要刷新列表
        cell.btnClickBlock = ^{
            [weakSelf initData];
        };
        // 下载模型赋值
        cell.fileInfo = fileInfo;
        // 下载的request
        cell.request = request;
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ZFFileModel *fileInfo = self.downloadObjectArr[indexPath.section][indexPath.row];
        [self.downloadManage deleteFinishFile:fileInfo];
    }else if (indexPath.section == 1) {
        ZFHttpRequest *request = self.downloadObjectArr[indexPath.section][indexPath.row];
        [self.downloadManage deleteRequest:request];
    }
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@"下载完成",@"下载中"][section];
}

#pragma mark - ZFDownloadDelegate

// 开始下载
- (void)startDownload:(ZFHttpRequest *)request
{
    NSLog(@"开始下载!");
}

// 下载中
- (void)updateCellProgress:(ZFHttpRequest *)request
{
    ZFFileModel *fileInfo = [request.userInfo objectForKey:@"File"];
    [self performSelectorOnMainThread:@selector(updateCellOnMainThread:) withObject:fileInfo waitUntilDone:YES];
}

// 下载完成
- (void)finishedDownload:(ZFHttpRequest *)request
{
    [self initData];
}

// 更新下载进度
- (void)updateCellOnMainThread:(ZFFileModel *)fileInfo
{
    NSArray *cellArr = [self.tableView visibleCells];
    for (id obj in cellArr) {
        if([obj isKindOfClass:[ZFDownloadingCell class]]) {
            ZFDownloadingCell *cell = (ZFDownloadingCell *)obj;
            if([cell.fileInfo.fileURL isEqualToString:fileInfo.fileURL]) {
                cell.fileInfo = fileInfo;
            }
        }
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UITableViewCell *cell            = (UITableViewCell *)sender;
    NSIndexPath *indexPath           = [self.tableView indexPathForCell:cell];
    ZFFileModel *model                 = self.downloadObjectArr[indexPath.section][indexPath.row];
    // 文件存放路径
    NSString *path                   = FILE_PATH(model.fileName);
    NSURL *videoURL                  = [NSURL fileURLWithPath:path];

    MoviePlayerViewController *movie = (MoviePlayerViewController *)segue.destinationViewController;
    movie.videoURL                   = videoURL;
}


@end
