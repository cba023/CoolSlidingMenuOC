//
//  CoolSlidingMenuCollectionViewCell.m
//  CoolSlidingMenuOC
//
//  Created by Creater on 2018/9/10.
//  Copyright © 2018年 CHENBO. All rights reserved.
//

#import "CoolSlidingMenuCollectionViewCell.h"

@implementation CoolSlidingMenuCollectionViewCell

- (void)setDicMenu:(NSDictionary *)dicMenu {
    _dicMenu = dicMenu;
    _imgViewIcon.image = [UIImage imageNamed:_dicMenu[@"image"]];
    _lblTitle.text = _dicMenu[@"title"];
    _lblTitle.adjustsFontSizeToFitWidth = YES;
}

@end
