//
//  CoolSlidingMenuView.h
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoolSlidingMenuView;
@protocol CoolSlidingMenuViewDelegate

@optional

/**
 菜单选中某个项

 @param menuView 菜单自己
 @param index 选中菜单项的脚标
 */
- (void)coolSlidingMenu:(CoolSlidingMenuView *)menuView didSelectedItemAtIndex:(NSInteger)index;

@end

@interface CoolSlidingMenuView : UIView

@property (nonatomic, strong) UIPageControl * pgCtrl;
@property (nonatomic, strong) UIColor * pgCtrlNormalColor;
@property (nonatomic, strong) UIColor * pgCtrlSelectedColor;
@property (nonatomic, assign) BOOL pgCtrlIsHidden;
@property (nonatomic, copy) NSArray * arrMenu;
@property (nonatomic, assign) NSInteger countRow;
@property (nonatomic, assign) NSInteger countCol;
@property (nonatomic, weak, nullable) id <CoolSlidingMenuViewDelegate> delegate;


@end
