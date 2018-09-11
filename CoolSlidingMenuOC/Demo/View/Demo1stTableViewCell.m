//
//  Demo1stTableViewCell.m
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import "Demo1stTableViewCell.h"
#import "CoolSlidingMenuView.h"

@interface Demo1stTableViewCell()<CoolSlidingMenuViewDelegate>

@property (nonatomic, strong) CoolSlidingMenuView * slidingMenuView;


@end

@implementation Demo1stTableViewCell

- (void)setArrMenu:(NSArray *)arrMenu {
    _arrMenu = arrMenu;
    _slidingMenuView.pgCtrl.hidden = _pgCtrlShouldHidden;
    _slidingMenuView.pgCtrlNormalColor = _pgCtrlNormalColor;
    _slidingMenuView.pgCtrlSelectedColor = _pgCtrlSelectedColor;
    _slidingMenuView.countRow = _countRow;
    _slidingMenuView.countCol = _countCol;
    _slidingMenuView.arrMenu = _arrMenu;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _slidingMenuView = [[CoolSlidingMenuView alloc] init];
        _slidingMenuView.delegate = self;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:_slidingMenuView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _slidingMenuView.contentMode = UIViewContentModeScaleAspectFit;
    _slidingMenuView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, self.bounds.size.height);
}


// CoolSlidingMenuDelegate
- (void)coolSlidingMenu:(CoolSlidingMenuView *)menuView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"点击了第%ld个元素", index);
}

@end
