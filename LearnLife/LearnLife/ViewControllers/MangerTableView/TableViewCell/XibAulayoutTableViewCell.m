
#import "XibAulayoutTableViewCell.h"
#import "UIView+SDAutoLayout.h"

@implementation XibAulayoutTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.contentLabel.sd_layout
            .leftSpaceToView(self.headImageView, 20)
            .topSpaceToView(self.contentView,3)
            .rightSpaceToView(self.contentView, 20)
            .autoHeightRatio(0);

    self.dateLable.sd_layout
            .rightSpaceToView(self.contentView, 20)
            .topSpaceToView(self.contentLabel, 10)
            .widthIs(200)
            .autoHeightRatio(0);

    // Initialization code
}

- (void)setModel:(AulayoutModel *)model {
    _model = model;
    self.contentLabel.text = [NSString stringWithFormat:@"%@", _model.contentStr];
    self.dateLable.text = [self compareCurrentTime:@"2016-08-09 01:12:12 +0000"];
//    self.dateLable.text = [self updateTimeForRow:@"1470614888"];
    UIView *bottomView = self.dateLable;
    [self setupAutoHeightWithBottomView:bottomView bottomMargin:10];
}

- (NSString *)compareCurrentTime:(NSString *)str {
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    //标准时间和北京时间差8个小时
    timeInterval = timeInterval - 8*60*60;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return  result;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
