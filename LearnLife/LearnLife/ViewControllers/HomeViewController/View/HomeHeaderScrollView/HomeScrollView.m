
#import "HomeScrollView.h"
#import "HomeScrollCollectionViewCell.h"

@interface HomeScrollView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation HomeScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 5 , 90);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor clearColor];
    
    UINib *nib = [UINib nibWithNibName:@"HomeScrollCollectionViewCell" bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"HomeScrollCollectionViewCell"];
    
    [self addSubview:collectionView];
    
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(SCREEN_WIDTH * 0.5, 195);
    pageControl.bounds = CGRectMake(0, 0, 100, 10);
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = RGB(25, 182, 160);
    pageControl.enabled = NO;
    pageControl.numberOfPages = 2;
    [self addSubview:pageControl];
    
    _pageControl=pageControl;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeScrollCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeScrollCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.scrollHeaderViewAction) {
        self.scrollHeaderViewAction(self, indexPath.item);
    }
}

#pragma mark 设置页码
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = (int) (scrollView.contentOffset.x / scrollView.frame.size.width + 0.5) % 20;
    self.pageControl.currentPage =page;
}


@end
