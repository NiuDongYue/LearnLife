
/**
 *  @brief  已经下载的视频文件Cell
 *  @author zz
 *  @date   2016.8.19
 */

#import <UIKit/UIKit.h>
#import <ZFDownload/ZFDownloadManager.h>

@interface ZFDownloadedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *fileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

/** 下载信息模型 */
@property (nonatomic, strong) ZFFileModel *fileInfo;

@end
