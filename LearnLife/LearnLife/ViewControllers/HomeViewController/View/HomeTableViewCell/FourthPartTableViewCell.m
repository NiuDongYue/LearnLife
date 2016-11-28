
#import "FourthPartTableViewCell.h"

@implementation FourthPartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"原价￥%d", 150]];
//    
   [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlinePatternSolid | NSUnderlineStyleSingle] range:NSMakeRange(2, 3)];
//
//    [attributedString addAttribute:NSShadowAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(2, 3)];
//
    self.costPrice.attributedText = attributedString;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
