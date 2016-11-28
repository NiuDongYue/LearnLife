
/**
 *  @brief  正在下载的视频文件Cell
 *  @author zz
 *  @date   2016.8.19
 */

#import <UIKit/UIKit.h>
#import <ZFDownload/ZFDownloadManager.h>

typedef void(^ZFBtnClickBlock)(void);

@interface ZFDownloadingCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *fileNameLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

/** 下载按钮点击回调block */
@property (nonatomic, copy  ) ZFBtnClickBlock  btnClickBlock;
/** 下载信息模型 */
@property (nonatomic, strong) ZFFileModel      *fileInfo;
/** 该文件发起的请求 */
@property (nonatomic,retain ) ZFHttpRequest    *request;


@end
