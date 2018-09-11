//
//  DemoTableViewController.h
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoTableViewController : UITableViewController

@property (nonatomic, strong) UIColor * pgCtrlNormalColor;
@property (nonatomic, strong) UIColor * pgCtrlSelectedColor;
@property (nonatomic, assign) BOOL pgCtrlShouldHidden;
@property (nonatomic, assign) NSInteger countRow;
@property (nonatomic, assign) NSInteger countCol;
@property (nonatomic, assign) NSInteger countItem;

@end
