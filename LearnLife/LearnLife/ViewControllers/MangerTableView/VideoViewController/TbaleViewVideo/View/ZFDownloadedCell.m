
#import "ZFDownloadedCell.h"

@implementation ZFDownloadedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFileInfo:(ZFFileModel *)fileInfo
{
    _fileInfo = fileInfo;
    NSString *totalSize = [ZFCommonHelper getFileSizeString:fileInfo.fileSize];
    self.fileNameLabel.text = fileInfo.fileName;
    self.sizeLabel.text = totalSize;
}

@end
