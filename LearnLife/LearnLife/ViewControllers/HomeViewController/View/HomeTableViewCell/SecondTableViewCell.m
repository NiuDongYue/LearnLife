
#import "SecondTableViewCell.h"
#import "SecondCollectionViewCell.h"

@interface SecondTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SecondTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self createUI];
    // Initialization code
}

- (void)createUI {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 2 - 0.3 , 60);
//    flowLayout.sectionInset = UIEdgeInsetsMake(0.4, 0.2, 0.2, 0);
    flowLayout.minimumInteritemSpacing = 0.15;
    flowLayout.minimumLineSpacing = 0.5;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.secondHeadView.frame.size.height + 6, SCREEN_WIDTH, 180) collectionViewLayout:flowLayout];
    collectionView.scrollEnabled = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor = RGB(225, 226, 228);
    
    UINib *nib = [UINib nibWithNibName:@"SecondCollectionViewCell" bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"SecondCollectionViewCell"];
    
    [self addSubview:collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SecondCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.clickItemAction) {
        self.clickItemAction(self, indexPath.item);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
