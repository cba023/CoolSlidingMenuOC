//
//  CoolSlidingMenuView.m
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import "CoolSlidingMenuView.h"
#import "CoolSlidingMenuManager.h"
#import "CoolSlidingMenuCollectionViewCell.h"

@interface CoolSlidingMenuView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionView;
//@property (nonatomic, weak) CoolSlidingMenuViewDelegate * delegate;

@end


@implementation CoolSlidingMenuView

- (instancetype)init {
    self = [super init];
    if (self) {
        _pgCtrl = [[UIPageControl alloc] init];
        _arrMenu = [NSArray array];
    }
    return self;
}

- (void)setArrMenu:(NSArray *)arrMenu {
    _arrMenu = arrMenu;
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat sideLength = UIScreen.mainScreen.bounds.size.width / _countCol;
    layout.itemSize = CGSizeMake(sideLength, sideLength + 8.0);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, (UIScreen.mainScreen.bounds.size.width / _countCol + 8.0) * _countRow) collectionViewLayout:layout];
    _collectionView.backgroundColor = UIColor.whiteColor;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.contentInset = UIEdgeInsetsZero;
    [_collectionView registerNib:[UINib nibWithNibName:@"CoolSlidingMenuCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cCell"];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"blankCell"];
    [self addSubview:_collectionView];
    [self addSubview:_pgCtrl];
    if (!_pgCtrlIsHidden) {
        _pgCtrl.currentPage = 0;
        _pgCtrl.pageIndicatorTintColor = _pgCtrlNormalColor;
        _pgCtrl.currentPageIndicatorTintColor = _pgCtrlSelectedColor;
    }
    _pgCtrl.numberOfPages = _arrMenu.count > _countCol * _countRow ? (_arrMenu.count + _countRow * _countCol - 1) / (_countRow * _countCol) : 0;
    [_collectionView reloadData];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat widthPgCtrl = [_pgCtrl sizeForNumberOfPages:_pgCtrl.numberOfPages].width;
    _pgCtrl.frame = CGRectMake((self.bounds.size.width - widthPgCtrl) / 2.0, self.bounds.size.height - 12.0, widthPgCtrl, 12.0);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger countSet = (_arrMenu.count + (_countRow * _countCol - 1)) / (_countRow * _countCol) * (_countRow * _countCol);
    return countSet;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger indexChanged = [CoolSlidingMenuManager.sharedInstance convertDirectionCountFromNumber:indexPath.row andRowCount:_countRow andColCount:_countCol];
    if (indexChanged < _arrMenu.count) {
        CoolSlidingMenuCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cCell" forIndexPath:indexPath];
        NSDictionary * dicMenu = _arrMenu[indexChanged];
        cell.dicMenu = dicMenu;
        return cell;
    }
    else {
        UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"blankCell" forIndexPath:indexPath];
        cell.userInteractionEnabled = NO;
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger indexChanged = [CoolSlidingMenuManager.sharedInstance convertDirectionCountFromNumber:indexPath.row andRowCount:_countRow andColCount:_countCol];
    if (indexChanged < _arrMenu.count) {
        [self.delegate coolSlidingMenu:self didSelectedItemAtIndex:indexChanged];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x / self.bounds.size.width;
    _pgCtrl.currentPage = page;
}

@end
