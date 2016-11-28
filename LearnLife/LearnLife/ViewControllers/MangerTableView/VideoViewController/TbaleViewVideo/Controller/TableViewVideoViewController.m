
#import "TableViewVideoViewController.h"
#import "ZFPlayerCell.h"
#import "ZFPlayerModel.h"
#import "ZFPlyerResolution.h"
#import <Masonry/Masonry.h>
#import <ZFDownload/ZFDownloadManager.h>
#import "MoviePlayerViewController.h"
#import "ZFDownloadViewController.h"

@interface TableViewVideoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) ZFPlayerView   *playerView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TableViewVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.rowHeight = 290;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    UIBarButtonItem *downLoadItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(loginDownLoadVC)];
    self.navigationItem.rightBarButtonItem = downLoadItem;
}

// 页面消失时候
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.playerView resetPlayer];
}

- (void)loginDownLoadVC {
    ZFDownloadViewController *zfDownloadViewController = [[ZFDownloadViewController alloc] init];
    [self.navigationController pushViewController:zfDownloadViewController animated:YES];

}

- (void)requestData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"videoData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    self.dataSource = @[].mutableCopy;
    NSArray *videoList = [rootDict objectForKey:@"videoList"];
    for (NSDictionary *dataDic in videoList) {
        ZFPlayerModel *model = [[ZFPlayerModel alloc] init];
        [model setValuesForKeysWithDictionary:dataDic];
        [self.dataSource addObject:model];
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {

    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        self.view.backgroundColor = [UIColor whiteColor];
    }else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view.backgroundColor = [UIColor blackColor];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellID        = @"cell";
    ZFPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZFPlayerCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 取到对应cell的model
    __block ZFPlayerModel *model       = self.dataSource[indexPath.row];
    // 赋值model
    cell.model                         = model;

    __block NSIndexPath *weakIndexPath = indexPath;
    __block ZFPlayerCell *weakCell     = cell;
    __weak typeof(self) weakSelf       = self;
    // 点击播放的回调
    cell.playBlock = ^(UIButton *btn) {
        weakSelf.playerView = [ZFPlayerView sharedPlayerView];
        // 设置播放前的站位图（需要在设置视频URL之前设置）
        weakSelf.playerView.placeholderImageName = @"loading_bgView";

        // 分辨率字典（key:分辨率名称，value：分辨率url)
        NSMutableDictionary *dic = @{}.mutableCopy;
        for (ZFPlyerResolution * resolution in model.playInfo) {
            [dic setValue:resolution.url forKey:resolution.name];
        }
        // 取出字典中的第一视频URL
        NSURL *videoURL = [NSURL URLWithString:dic.allValues.firstObject];

        // 设置player相关参数(需要设置imageView的tag值，此处设置的为101)
        [weakSelf.playerView setVideoURL:videoURL
                           withTableView:weakSelf.tableView
                             AtIndexPath:weakIndexPath
                        withImageViewTag:101];
        [weakSelf.playerView addPlayerToCellImageView:weakCell.picView];
        weakSelf.playerView.title = @"古道旁 我欲语泪先下";

        // 下载功能
        weakSelf.playerView.hasDownload   = YES;
        // 下载按钮的回调
        weakSelf.playerView.downloadBlock = ^(NSString *urlStr) {
            // 此处是截取的下载地址，可以自己根据服务器的视频名称来赋值
            NSString *name = [urlStr lastPathComponent];
            [[ZFDownloadManager sharedDownloadManager] downFileUrl:urlStr filename:name fileimage:nil];
            // 设置最多同时下载个数（默认是3）
            [ZFDownloadManager sharedDownloadManager].maxCount = 1;
        };

        // 赋值分辨率字典
        weakSelf.playerView.resolutionDic = dic;
        //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
        weakSelf.playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
        // 自动播放
        [weakSelf.playerView autoPlayTheVideo];
    };
    
    cell.clickBtnWithType = ^(ZFPlayerCell *cell, NSInteger btnType) {
        switch (btnType) {
                
            case btnTypePraise:
                NSLog(@"走过岁月我才发现世界多不完美");
                break;
                
            case btnTypeUnpraise:
                NSLog(@"成功或失败都有一些错觉");
                break;
                
            case btnTypeShare:
                NSLog(@"沧海有多广江湖有多深");
                break;

            case btnTypeMessage:
                NSLog(@"局中人才了解");
                break;
                
            default:
                break;
        }
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath---%zd",indexPath.row);
    MoviePlayerViewController *moviePlayerViewController = [[MoviePlayerViewController alloc] init];
    __block ZFPlayerModel *model       = self.dataSource[indexPath.row];
    NSString *urlStr = model.playUrl;
    moviePlayerViewController.videoURL = [NSURL URLWithString:urlStr];
//    [self.navigationController pushViewController:moviePlayerViewController animated:YES];
}


- (void)dealloc {
    NSLog(@" %@  delloc", [self class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
