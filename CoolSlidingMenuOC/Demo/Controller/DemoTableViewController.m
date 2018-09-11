//
//  DemoTableViewController.m
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import "DemoTableViewController.h"
#import "Demo1stTableViewCell.h"

@interface DemoTableViewController ()

@property (nonatomic, copy) NSDictionary * dataDic;
@property (nonatomic, copy) NSMutableArray * arrMenu;
@property (nonatomic, copy) NSArray * arrIcon;

@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setUI];
    [self regReuseView];
}

- (void)setData {
    _arrMenu = [NSMutableArray array];
    NSString * plistPath = [NSBundle.mainBundle pathForResource:@"menuData" ofType:@"plist"];
    NSMutableArray * arrayAllMenu = [NSMutableArray arrayWithArray:[NSArray arrayWithContentsOfFile:plistPath]];
    for (NSInteger i = 0; i < _countItem; i++) {
        [_arrMenu addObject:arrayAllMenu[i]];
    }
    [self.tableView reloadData];
}

- (void)setUI {
    self.title = @"示例页面";
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
}

- (void)regReuseView {
    [self.tableView registerClass:[Demo1stTableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        // 10.0 用于显示pageControl, 8.0 为单个菜单按钮高度与宽度的差 ,此处数字不需要修改
        return (UIScreen.mainScreen.bounds.size.width / _countCol + 8.0) * _countRow + 10.0;
    } else {
        return 50.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Demo1stTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.pgCtrlShouldHidden = _pgCtrlShouldHidden;
    cell.pgCtrlNormalColor = _pgCtrlNormalColor;
    cell.pgCtrlSelectedColor = _pgCtrlSelectedColor;
    cell.countRow = _countRow;
    cell.countCol = _countCol;
    cell.arrMenu = _arrMenu;
    return cell;
}


@end
