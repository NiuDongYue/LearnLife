
#import "ZFPlayerCell.h"
#import <AVFoundation/AVFoundation.h>
#import "UIImageView+WebCache.h"
#import <Masonry/Masonry.h>

@implementation ZFPlayerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.picView.userInteractionEnabled = YES;
    
    [self cutRoundView:self.avatarImageView];
    
    // 设置imageView的tag，在PlayerView中取（建议设置100以上）
    self.picView.tag = 101;
    
    // 代码添加playerBtn到imageView上
    self.playBtn = [[UIButton alloc] init];
    [self.playBtn setImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateNormal];
   [self.playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];

    [self.picView addSubview:self.playBtn];
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.picView);
    }];
    
    self.userInteractionEnabled = YES;
    self.titleLabel.userInteractionEnabled = YES;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        NSLog(@"dianji l ");
        if (self.playBlock) {
            self.playBlock(x);
        }

    }];
    [self.titleLabel addGestureRecognizer:tap];
    // Initialization code
}

// 切圆角
- (void)cutRoundView:(UIImageView *)imageView {
    CGFloat corner = imageView.frame.size.width / 2;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)];
    shapeLayer.path = path.CGPath;
    imageView.layer.mask = shapeLayer;
}

- (void)setModel:(ZFPlayerModel *)model {
    _model = model;

    self.titleLabel.text = _model.title;
    [self.picView sd_setImageWithURL:[NSURL URLWithString:_model.coverForFeed]];
}

- (void)play:(UIButton *)sender {
    if (self.playBlock) {
        self.playBlock(sender);
    }
}
- (IBAction)clickPraiseBtn:(id)sender {
    if (self.clickBtnWithType) {
        self.clickBtnWithType(self, btnTypePraise);
    }
    UIButton *btn = sender;
    btn.selected = !btn.selected;
    if (btn.selected) {
        [btn setImage:[UIImage imageNamed:@"mainCellDingClick"] forState:UIControlStateNormal];
    }
    else [btn setImage:[UIImage imageNamed:@"mainCellDing"] forState:UIControlStateNormal];
}

- (IBAction)clickUnpraiseBtn:(id)sender {
    if (self.clickBtnWithType) {
        self.clickBtnWithType(self, btnTypeUnpraise);
    }
}
- (IBAction)clickShareBtn:(id)sender {
    if (self.clickBtnWithType) {
        self.clickBtnWithType(self, btnTypeShare);
    }
}

- (IBAction)clickMessageBtn:(id)sender {
    if (self.clickBtnWithType) {
        self.clickBtnWithType(self, btnTypeMessage);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
