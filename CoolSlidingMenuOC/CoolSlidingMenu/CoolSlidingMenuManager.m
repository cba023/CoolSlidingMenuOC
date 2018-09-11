//
//  CoolSlidingMenuManager.m
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import "CoolSlidingMenuManager.h"

@implementation CoolSlidingMenuManager

static id _instance;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}


/**
 根据菜单行列转换菜单的位置序号
 
 @param number 转换位置前的菜单所属的位置编号
 @param rowCount 行数
 @param colCount 列数
 @return 转换位置后的菜单所属的位置编号
 */
- (NSInteger)convertDirectionCountFromNumber:(NSInteger)number andRowCount:(NSInteger)rowCount andColCount:(NSInteger)colCount {
    NSInteger tempH = number / (colCount * rowCount);
    NSInteger tempL = number % (colCount * rowCount);
    NSInteger result = tempL - (tempL / rowCount) * (rowCount - 1) + tempL % rowCount * (colCount - 1) + tempH * (colCount * rowCount);
    return result;
}


@end
