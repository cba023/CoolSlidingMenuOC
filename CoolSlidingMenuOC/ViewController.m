//
//  ViewController.m
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import "ViewController.h"
#import "DemoTableViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *swiPgCtrlShouldHidden;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segPgCtrlNormalColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segPgCtrlSelectedColor;
@property (weak, nonatomic) IBOutlet UIStepper *stepperRowsCount;
@property (weak, nonatomic) IBOutlet UIStepper *stepperColsCount;
@property (weak, nonatomic) IBOutlet UIStepper *stepperItemsCount;
@property (weak, nonatomic) IBOutlet UILabel *lblRows;
@property (weak, nonatomic) IBOutlet UILabel *lblCols;
@property (weak, nonatomic) IBOutlet UILabel *lblItemsCount;

@property (nonatomic, strong) UIColor * pgCtrlNormalColor;
@property (nonatomic, strong) UIColor * pgCtrlSelectedColor;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUIAndData];
}

- (void)setUIAndData {
    _pgCtrlNormalColor = UIColor.lightGrayColor;
    _pgCtrlSelectedColor = UIColor.redColor;
    _swiPgCtrlShouldHidden.on = NO;
    [_segPgCtrlNormalColor addTarget:self action:@selector(segPgCtrlNormalColorValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_segPgCtrlSelectedColor addTarget:self action:@selector(segPgCtrlSelectedColorValueChanged:) forControlEvents:UIControlEventValueChanged];
    _stepperRowsCount.minimumValue = 1;
    _stepperRowsCount.maximumValue = 5;
    _stepperColsCount.minimumValue = 4;
    _stepperColsCount.maximumValue = 10;
    _stepperItemsCount.minimumValue = 1;
    _stepperItemsCount.maximumValue = 30;
    _stepperRowsCount.value = 2;
    _stepperColsCount.value = 5;
    _stepperItemsCount.value = 20;
    _stepperRowsCount.stepValue = 1;
    _stepperColsCount.stepValue = 1;
    _stepperItemsCount.stepValue = 1;
    _lblRows.text = [NSString stringWithFormat:@"%ld", (NSInteger)_stepperRowsCount.value];
    _lblCols.text = [NSString stringWithFormat:@"%ld", (NSInteger)_stepperColsCount.value];
    _lblItemsCount.text = [NSString stringWithFormat:@"%ld", (NSInteger)_stepperItemsCount.value];
    [_stepperRowsCount addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    [_stepperColsCount addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    [_stepperItemsCount addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)segPgCtrlNormalColorValueChanged:(UISegmentedControl *)sender {
    _pgCtrlNormalColor = sender.selectedSegmentIndex == 0 ? UIColor.lightGrayColor : UIColor.yellowColor;
}

- (void)segPgCtrlSelectedColorValueChanged:(UISegmentedControl *)sender {
    _pgCtrlSelectedColor = sender.selectedSegmentIndex == 0 ? UIColor.redColor : UIColor.orangeColor;
}

- (void)stepperValueChanged:(UIStepper *)sender {
    _lblRows.text = [NSString stringWithFormat:@"%ld", (NSInteger)_stepperRowsCount.value];
    _lblCols.text = [NSString stringWithFormat:@"%ld", (NSInteger)_stepperColsCount.value];
    _lblItemsCount.text = [NSString stringWithFormat:@"%ld", (NSInteger)_stepperItemsCount.value];
}

- (IBAction)btnBottomClicked:(id)sender {
    DemoTableViewController * tvc = [[DemoTableViewController alloc] initWithStyle:UITableViewStylePlain];
    tvc.pgCtrlShouldHidden = _swiPgCtrlShouldHidden.on;
    tvc.pgCtrlNormalColor = _pgCtrlNormalColor;
    tvc.pgCtrlSelectedColor = _pgCtrlSelectedColor;
    tvc.countRow = (NSInteger)_stepperRowsCount.value;
    tvc.countCol = (NSInteger)_stepperColsCount.value;
    tvc.countItem = (NSInteger)_stepperItemsCount.value;
    [self.navigationController pushViewController:tvc animated:YES];
}


@end
